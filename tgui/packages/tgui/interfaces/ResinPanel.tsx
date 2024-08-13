import { BooleanLike, classes } from 'common/react';
import { useBackend } from 'tgui/backend';
import { Box, Button, Dropdown, Section, Stack, Tabs } from 'tgui/components';
import { Window } from 'tgui/layouts';

interface ResinPanelData {
  structure_list: StructureEntry[];
  hives_list: string[];
  selected_structure: string;
  selected_hive: string;
  build_click_intercept: BooleanLike;
}

interface StructureEntry {
  name: string;
  image: string;
  id: string;
}

export const ResinPanel = () => {
  const { act, data } = useBackend<ResinPanelData>();
  const {
    structure_list,
    hives_list,
    selected_structure,
    selected_hive,
    build_click_intercept,
  } = data;

  let compact = false;

  return (
    <Window
      width={350}
      height={15 + structure_list.length * 80}
      title="Resin Panel"
      theme="admin"
    >
      <Window.Content>
        <Section
          title="Resin"
          buttons={
            <Stack>
              <Stack.Item>
                <Button
                  selected={build_click_intercept}
                  tooltip="LMB to place, MMB to remove"
                  onClick={() => act('toggle_build_click_intercept')}
                >
                  Click Build
                </Button>
              </Stack.Item>
              <Stack.Item>
                <Dropdown
                  options={hives_list}
                  selected={selected_hive}
                  width="15rem"
                  onSelected={(selected_hive) => {
                    act('set_selected_hive', { selected_hive });
                  }}
                />
              </Stack.Item>
            </Stack>
          }
          scrollable
          fill
        >
          <Tabs vertical fluid fill>
            {structure_list.map((item, index) => (
              <Tabs.Tab
                key={index}
                selected={item.id === selected_structure}
                onClick={() => act('set_selected_structure', { type: item.id })}
              >
                <Stack align="center">
                  <Stack.Item>
                    <span
                      className={classes([
                        `chooseresin${compact ? '32x32' : '64x64'}`,
                        `${item.image}${compact ? '' : '_big'}`,
                        'ChooseResin__BuildIcon',
                      ])}
                    />
                  </Stack.Item>
                  <Stack.Item grow>
                    <Box>{item.name}</Box>
                  </Stack.Item>
                </Stack>
              </Tabs.Tab>
            ))}
          </Tabs>
        </Section>
      </Window.Content>
    </Window>
  );
};
