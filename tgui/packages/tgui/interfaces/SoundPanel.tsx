import { debounce } from 'common/timer';
import { Component, useState } from 'react';
import { useBackend } from 'tgui/backend';
import {
  Box,
  Button,
  Dropdown,
  Input,
  Section,
  Slider,
  Stack,
  Tabs,
} from 'tgui/components';
import { Window } from 'tgui/layouts';

interface SoundPanelData {
  sound_list: string[];
  category_list: string[];
  zlevel_list: string[];
  group_list: string[];
  sound_path: string;
  sound_category: string;
  sound_volume: number;
  sound_pitch: number;
  sound_duration: number;
  target_player_desc: string;
  target_loc_desc: string;
  loc_click_intercept: string;
  loc_click_play: string;
  target_zlevel: string;
  target_group: string;
}

export const SoundPanel = () => {
  const { act, data } = useBackend<SoundPanelData>();
  const { sound_list, sound_path } = data;

  const PAGES = [
    {
      title: 'Client',
      component: <ClientPage />,
    },
    {
      title: 'Local',
      component: <LocalPage />,
    },
    {
      title: 'ZLevel',
      component: <ZLevelPage />,
    },
    {
      title: 'Server',
      component: <ServerPage />,
    },
  ];
  const [tabIndex, setTabIndex] = useState<number>(
    PAGES.findIndex((page) => page.title === 'Local'),
  );

  return (
    <Window width={450} height={350} title="Sound Panel" theme="admin">
      <Window.Content>
        <Stack fill>
          <Stack.Item grow>
            <Stack fill vertical>
              <ListSearchBox
                items={sound_list}
                selection={sound_path}
                onSelection={(value) =>
                  act('set_sound_path', { sound_path: value })
                }
              />
            </Stack>
          </Stack.Item>
          <Stack.Item>
            <Stack vertical>
              <Stack.Item>
                <SoundOptions />
              </Stack.Item>
              <Stack.Item>
                <Section title="Hearers">
                  <Tabs>
                    {PAGES.map((page, i) => {
                      return (
                        <Tabs.Tab
                          key={i}
                          selected={i === tabIndex}
                          onClick={() => setTabIndex(i)}
                        >
                          {page.title}
                        </Tabs.Tab>
                      );
                    })}
                  </Tabs>
                  {PAGES[tabIndex].component}
                </Section>
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

interface ListSearchBoxProps {
  readonly items: string[];
  readonly selection: string;
  readonly onSelection: (value: string) => void;
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
  };
  handleQueryChange(value: string) {
    if (value === this.state.query) {
      return;
    }
    this.setState({
      query: value,
    });
    this.handleSelectionChange('');
  }
  handleSelectionChange(value: string) {
    this.props.onSelection(value);
  }

  onSearch = debounce((value: string) => {
    this.handleQueryChange(value);
  }, 250);

  parsedItems = this.props.items
    .map<ListSearchBoxEntry>((item, index) => {
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

  render() {
    return (
      <>
        <Stack.Item grow>
          <Section fill scrollable title="File">
            {this.parsedItems
              .filter((item, index) => {
                return item.fileName
                  .toLowerCase()
                  .includes(this.state.query.toLowerCase());
              })
              .map((item) => {
                return (
                  <Button
                    color="transparent"
                    fluid
                    key={item.id}
                    my={0}
                    onClick={() => this.handleSelectionChange(item.fullPath)}
                    selected={item.fullPath === this.props.selection}
                    style={{
                      animation: 'none',
                      transition: 'none',
                    }}
                  >
                    {item.fileName}
                    <Box
                      fontSize="0.75rem"
                      style={{
                        opacity: '0.5',
                        position: 'absolute',
                        right: '0',
                        top: '0',
                      }}
                    >
                      {item.dirName}
                    </Box>
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
      </>
    );
  }
}

const SoundOptions = () => {
  const { act, data } = useBackend<SoundPanelData>();
  const {
    category_list,
    sound_path,
    sound_category,
    sound_volume,
    sound_pitch,
    sound_duration,
  } = data;

  return (
    <Section title="Options">
      <Stack vertical>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Box color="label" textAlign="center">
                Category
              </Box>
              <Dropdown
                onSelected={(value) =>
                  act('set_sound_category', { sound_category: value })
                }
                options={category_list}
                selected={sound_category}
                menuWidth="100px"
                width="100px"
              />
            </Stack.Item>
            <Stack.Item grow>
              <Box color="label" textAlign="center">
                Volume
              </Box>
              <Slider
                minValue={0}
                maxValue={100}
                value={sound_volume}
                step={5}
                stepPixelSize={5}
                onChange={(e, value) =>
                  act('set_sound_volume', { sound_volume: value })
                }
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Stack>
            <Stack.Item grow>
              <Box color="label" textAlign="center">
                Pitch
              </Box>
              <Slider
                minValue={0.5}
                maxValue={2}
                value={sound_pitch}
                step={0.1}
                stepPixelSize={5}
                onChange={(e, value) =>
                  act('set_sound_pitch', { sound_pitch: value })
                }
              />
            </Stack.Item>
            <Stack.Item grow>
              <Box color="label" textAlign="center">
                Duration
              </Box>
              <Slider
                minValue={0.5}
                maxValue={2}
                value={sound_duration}
                step={0.1}
                stepPixelSize={5}
                onChange={(e, value) =>
                  act('set_sound_duration', { sound_duration: value })
                }
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Button
                color="good"
                disabled={!sound_path}
                onClick={() => act('play_preview')}
              >
                Preview
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button color="bad" onClick={() => act('stop_preview')}>
                Stop
              </Button>
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const ClientPage = () => {
  const { act, data } = useBackend<SoundPanelData>();
  const { target_player_desc, sound_path } = data;

  return (
    <Stack vertical>
      <Stack.Item>
        <Button onClick={() => act('select_client')}>Select Client</Button>
      </Stack.Item>
      <Stack.Item>
        <Box>{target_player_desc || 'N/A'}</Box>
      </Stack.Item>
      <Stack.Item>
        <Button
          color="good"
          disabled={!sound_path || !target_player_desc}
          onClick={() => act('play_client')}
        >
          Play to Client
        </Button>
      </Stack.Item>
    </Stack>
  );
};

const LocalPage = () => {
  const { act, data } = useBackend<SoundPanelData>();
  const { target_loc_desc, sound_path, loc_click_intercept, loc_click_play } =
    data;

  return (
    <Stack vertical>
      <Stack.Item>
        <Stack>
          <Stack.Item>
            <Button
              selected={!!loc_click_intercept}
              onClick={() => act('toggle_loc_click_intercept')}
            >
              Click Target
            </Button>
          </Stack.Item>
          <Stack.Item>
            <Button.Checkbox
              checked={!!loc_click_play}
              onClick={() => act('toggle_loc_click_play')}
            >
              Play on Click
            </Button.Checkbox>
          </Stack.Item>
        </Stack>
      </Stack.Item>
      <Stack.Item>
        <Box>{target_loc_desc || 'N/A'}</Box>
      </Stack.Item>
      <Stack.Item>
        <Button
          color="good"
          disabled={!sound_path || !target_loc_desc}
          onClick={() => act('play_local')}
        >
          Play Locally
        </Button>
      </Stack.Item>
    </Stack>
  );
};

const ZLevelPage = () => {
  const { act, data } = useBackend<SoundPanelData>();
  const { zlevel_list, sound_path, target_zlevel } = data;

  return (
    <Stack vertical>
      <Stack.Item>
        <Dropdown
          options={zlevel_list}
          selected={target_zlevel}
          onSelected={(value) =>
            act('set_target_zlevel', { target_zlevel: value })
          }
          menuWidth="180px"
          width="180px"
          over
        />
      </Stack.Item>
      <Stack.Item>
        <Button
          color="good"
          disabled={!sound_path || !target_zlevel}
          onClick={() => act('play_zlevel')}
        >
          Play to ZLevel
        </Button>
      </Stack.Item>
    </Stack>
  );
};

const ServerPage = () => {
  const { act, data } = useBackend<SoundPanelData>();
  const { group_list, sound_path, target_group } = data;

  return (
    <Stack vertical>
      <Stack.Item>
        <Dropdown
          options={group_list}
          selected={target_group}
          onSelected={(value) =>
            act('set_target_group', { target_group: value })
          }
          menuWidth="80px"
          width="80px"
          over
        />
      </Stack.Item>
      <Stack.Item>
        <Button
          color="good"
          disabled={!sound_path || !target_group}
          onClick={() => act('play_group')}
        >
          Play to Group
        </Button>
      </Stack.Item>
    </Stack>
  );
};
