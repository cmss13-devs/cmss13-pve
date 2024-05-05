import { useBackend, useLocalState } from 'tgui/backend';
import { Box, Button, Dropdown, Input, Section, Slider, Stack, Tabs } from 'tgui/components';
import { Window } from 'tgui/layouts';
import { Component, Fragment } from 'inferno';
import { debounce } from 'common/timer';
import { logger } from '../logging';

interface SoundPanelData {
  sound_list: string[];
  category_list: string[];
  zlevel_list: string[];
  group_list: string[];
  target_loc_desc: string;
  target_player_desc: string;
  loc_click_intercept: string;
}

export const SoundPanel = (props, context) => {
  const { act, data } = useBackend<SoundPanelData>(context);
  const {
    sound_list,
    category_list,
    zlevel_list,
    group_list,
    target_loc_desc,
    target_player_desc,
    loc_click_intercept,
  } = data;

  const [soundPath, setSoundPath] = useLocalState<string>(
    context,
    'soundPath',
    ''
  );
  const [soundVolume, setSoundVolume] = useLocalState<number>(
    context,
    'soundVolume',
    50
  );
  const [soundCategory, setSoundCategory] = useLocalState<string>(
    context,
    'soundCategory',
    category_list[0]
  );
  const [targetZLevel, setTargetZLevel] = useLocalState<string>(
    context,
    'targetZLevel',
    zlevel_list[0]
  );
  const [targetGroup, setTargetGroup] = useLocalState<string>(
    context,
    'targetGroup',
    group_list[0]
  );

  const PAGES = [
    {
      title: 'Client',
      component: () => (
        <ClientPage
          targetPlayerDesc={target_player_desc}
          canPlay={soundPath && target_player_desc}
          onPlay={() =>
            act('play_client', {
              sound_path: soundPath,
              sound_category: soundCategory,
              sound_volume: soundVolume,
            })
          }
        />
      ),
    },
    {
      title: 'Local',
      component: () => (
        <LocalPage
          targetLocDesc={target_loc_desc}
          locClickIntercept={loc_click_intercept}
          canPlay={soundPath && target_loc_desc}
          onPlay={() =>
            act('play_local', {
              sound_path: soundPath,
              sound_category: soundCategory,
              sound_volume: soundVolume,
            })
          }
        />
      ),
    },
    {
      title: 'ZLevel',
      component: () => (
        <ZLevelPage
          targetZLevel={targetZLevel}
          setTargetZLevel={setTargetZLevel}
          canPlay={soundPath && targetZLevel}
          onPlay={() =>
            act('play_zlevel', {
              sound_path: soundPath,
              sound_category: soundCategory,
              sound_volume: soundVolume,
              target_zlevel: targetZLevel,
            })
          }
        />
      ),
    },
    {
      title: 'Server',
      component: () => (
        <ServerPage
          targetGroup={targetGroup}
          setTargetGroup={setTargetGroup}
          canPlay={soundPath && targetGroup}
          onPlay={() =>
            act('play_group', {
              sound_path: soundPath,
              sound_category: soundCategory,
              sound_volume: soundVolume,
              target_group: targetGroup,
            })
          }
        />
      ),
    },
  ];

  const [tabIndex, setTabIndex] = useLocalState<number>(
    context,
    'tabIndex',
    PAGES.findIndex((page) => page.title === 'Local')
  );

  return (
    <Window width={450} height={350} title="Sound Panel" theme="admin">
      <Window.Content>
        <Stack fill>
          <Stack.Item grow>
            <Stack fill vertical>
              <ListSearchBox
                items={sound_list}
                selection={soundPath}
                onSelection={setSoundPath}
              />
            </Stack>
          </Stack.Item>
          <Stack.Item>
            <Stack fill vertical justify="space-between">
              <Stack.Item>
                <Section title="Hearers">
                  <Tabs>
                    {PAGES.map((page, i) => {
                      return (
                        <Tabs.Tab
                          key={i}
                          selected={i === tabIndex}
                          onClick={() => setTabIndex(i)}>
                          {page.title}
                        </Tabs.Tab>
                      );
                    })}
                  </Tabs>
                  {PAGES[tabIndex].component()}
                </Section>
              </Stack.Item>
              <Stack.Item>
                <Stack vertical>
                  <Stack.Item>
                    <Stack>
                      <Stack.Item>
                        <Box color="label" textAlign="center">
                          Category
                        </Box>
                        <Dropdown
                          noscroll
                          onSelected={(value) => setSoundCategory(value)}
                          options={category_list}
                          over
                          selected={soundCategory}
                          width="90px"
                        />
                      </Stack.Item>
                      <Stack.Item grow>
                        <Box color="label" textAlign="center">
                          Volume
                        </Box>
                        <Slider
                          minValue={0}
                          maxValue={100}
                          value={soundVolume}
                          step={5}
                          stepPixelSize={5}
                          onChange={(e, value) => setSoundVolume(value)}
                        />
                      </Stack.Item>
                    </Stack>
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      disabled={!soundPath}
                      content="Preview"
                      onClick={() =>
                        act('play_preview', {
                          sound_path: soundPath,
                          sound_category: soundCategory,
                          sound_volume: soundVolume,
                        })
                      }
                    />
                  </Stack.Item>
                </Stack>
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

interface ListSearchBoxProps {
  items: string[];
  selection: string;
  onSelection: (value: string) => void;
}

interface ListSearchBoxState {
  query: string;
  // selection: string;
}

interface ListSearchBoxEntry {
  id: number;
  fileName: string;
  dirName: string;
  fullPath: string;
}

class ListSearchBox extends Component<ListSearchBoxProps, ListSearchBoxState> {
  state: ListSearchBoxState = {
    query: '',
    // selection: '',
  };
  handleQueryChange(value: string) {
    if (value === this.state.query) {
      return;
    }
    this.setState({
      query: value,
    });
    this.filteredItems = this.getFilteredItems(this.parsedItems);

    /*
    if (this.state.selection.toLowerCase().includes(value.toLowerCase())) {
      return;
    }
    */
    this.handleSelectionChange('');
  }
  handleSelectionChange(value: string) {
    this.props.onSelection(value);
  }

  onSearch = debounce((value: string) => {
    this.handleQueryChange(value);
  }, 250);

  /*
  shouldComponentUpdate(nextState) {
    return (
      nextState.selection !== this.state.selection ||
      nextState.query !== this.state.query
    );
  }
  */

  parsedItems = this.props.items
    .map<ListSearchBoxEntry>((item, index) => {
      if (index === 0) logger.log('parsing items');
      const dirIndex = item.lastIndexOf('/');
      const dirName = item.slice(6, dirIndex);
      const extIndex = item.lastIndexOf('.');
      const fileName = item.slice(dirIndex + 1, extIndex);

      return {
        id: index,
        fileName: fileName,
        dirName: dirName,
        fullPath: item,
      };
    })
    .sort((a, b) => {
      if (a.fileName > b.fileName) return 1;
      if (a.fileName < b.fileName) return -1;
      if (a.dirName > b.dirName) return 1;
      if (a.dirName < b.dirName) return -1;
      return a.id - b.id;
    });

  getFilteredItems(items: ListSearchBoxEntry[]) {
    return items.filter((item, index) => {
      if (index === 0) logger.log('filtering items');
      return item.fileName
        .toLowerCase()
        .includes(this.state.query.toLowerCase());
    });
  }

  filteredItems = this.getFilteredItems(this.parsedItems);

  render() {
    logger.log('in render');
    return (
      <Fragment>
        <Stack.Item grow>
          <Section fill scrollable title="Sound">
            {this.filteredItems.map((item) => {
              return (
                <Button
                  color="transparent"
                  content={item.fileName}
                  fluid
                  // id={item.id}
                  key={item.id}
                  my={0}
                  onClick={() => this.handleSelectionChange(item.fullPath)}
                  selected={item.fullPath === this.props.selection}
                  style={{
                    animation: 'none',
                    transition: 'none',
                  }}
                  // tabIndex={undefined}
                >
                  <div
                    style={{
                      'font-size': '0.75rem',
                      opacity: 0.5,
                      position: 'absolute',
                      right: 0,
                      top: 0,
                    }}>
                    {item.dirName}
                  </div>
                </Button>
              );
            })}
          </Section>
        </Stack.Item>
        <Stack.Item>
          <Input
            fluid
            onInput={(e, value) => this.onSearch(value)}
            placeholder="Search..."
            value={this.state.query}
          />
        </Stack.Item>
      </Fragment>
    );
  }
}

const ClientPage = (props, context) => {
  const { act, data } = useBackend<SoundPanelData>(context);
  const { targetPlayerDesc, canPlay, onPlay } = props;

  return (
    <Stack vertical>
      <Stack.Item>
        <Button content="Select Client" onClick={() => act('select_client')} />
      </Stack.Item>
      <Stack.Item>
        <Box>{targetPlayerDesc || 'N/A'}</Box>
      </Stack.Item>
      <Stack.Item>
        <Button disabled={!canPlay} content="Play" onClick={onPlay} />
      </Stack.Item>
    </Stack>
  );
};

const LocalPage = (props, context) => {
  const { act, data } = useBackend<SoundPanelData>(context);
  const { targetLocDesc, locClickIntercept, canPlay, onPlay } = props;

  return (
    <Stack vertical>
      <Stack.Item>
        <Button
          selected={locClickIntercept}
          content="Click Target"
          onClick={() => act('toggle_loc_click')}
        />
      </Stack.Item>
      <Stack.Item>
        <Box>{targetLocDesc || 'N/A'}</Box>
      </Stack.Item>
      <Stack.Item>
        <Button disabled={!canPlay} content="Play" onClick={onPlay} />
      </Stack.Item>
    </Stack>
  );
};

const ZLevelPage = (props, context) => {
  const { data } = useBackend<SoundPanelData>(context);
  const { zlevel_list } = data;
  const { targetZLevel, setTargetZLevel, canPlay, onPlay } = props;

  return (
    <Stack vertical>
      <Stack.Item>
        <Dropdown
          options={zlevel_list}
          selected={targetZLevel}
          onSelected={setTargetZLevel}
          width="180px"
          noscroll
        />
      </Stack.Item>
      <Stack.Item>
        <Button disabled={!canPlay} content="Play" onClick={onPlay} />
      </Stack.Item>
    </Stack>
  );
};

const ServerPage = (props, context) => {
  const { data } = useBackend<SoundPanelData>(context);
  const { group_list } = data;
  const { targetGroup, setTargetGroup, canPlay, onPlay } = props;

  return (
    <Stack vertical>
      <Stack.Item>
        <Dropdown
          options={group_list}
          selected={targetGroup}
          onSelected={setTargetGroup}
          width="80px"
          noscroll
        />
      </Stack.Item>
      <Stack.Item>
        <Button disabled={!canPlay} content="Play" onClick={onPlay} />
      </Stack.Item>
    </Stack>
  );
};
