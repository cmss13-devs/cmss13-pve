import { useState } from 'react';

import { useBackend } from '../backend';
import {
  Box,
  Button,
  Collapsible,
  Divider,
  Dropdown,
  Section,
  Stack,
} from '../components';
import { Window } from '../layouts';

type AIEquipmentPreset = {
  name: string;
  path: string;
  description: string;
};

type BackendContext = {
  presets: { [key: string]: AIEquipmentPreset[] };
  selected_faction: string;
  selectable_factions: string[];
  spawn_ai: boolean;
  paradrop: boolean;
  equipment_settings: string[];
  selected_equipment: string;
};

export const HumanAISpawner = (props) => {
  const { data, act } = useBackend<BackendContext>();
  const [chosenPreset, setPreset] = useState<AIEquipmentPreset | null>(null);
  const { presets } = data;
  return (
    <Window title="Human AI Spawner" width={800} height={900}>
      <Window.Content>
        <Stack fill vertical>
          <Stack fill>
            <Stack.Item grow mr={1}>
              <Section fill scrollable>
                {Object.keys(presets).map((dictKey) => (
                  <Collapsible title={dictKey} key={dictKey} color="good">
                    {presets[dictKey].map((squad) => (
                      <Box pb={'12px'} key={squad.path}>
                        <Button
                          fontSize="15px"
                          textAlign="center"
                          selected={squad === chosenPreset}
                          width="100%"
                          key={squad.path}
                          onClick={() => {
                            setPreset(squad);

                            act('remember_path', {
                              path: squad.path,
                            });
                          }}
                        >
                          {squad.name}
                        </Button>
                      </Box>
                    ))}
                  </Collapsible>
                ))}
              </Section>
            </Stack.Item>
            <Divider vertical />
            <Stack.Item width="30%">
              <Section title="Selected Preset">
                {chosenPreset !== null ? (
                  <Stack vertical>
                    <Stack.Item>{chosenPreset.description}</Stack.Item>
                    <Stack.Item>
                      <Button
                        textAlign="center"
                        width="100%"
                        onClick={() =>
                          act('create_ai', {
                            path: chosenPreset.path,
                            selected_faction: data.selected_faction,
                            selected_equipment: data.selected_equipment,
                          })
                        }
                      >
                        Spawn
                      </Button>
                    </Stack.Item>
                    <Stack.Item>
                      <Dropdown
                        options={data.selectable_factions}
                        selected={data.selected_faction}
                        displayText={
                          <span
                            style={{
                              color: data.selected_faction
                                ?.toLowerCase()
                                .includes('Hive')
                                ? 'purple'
                                : data.selected_faction !== chosenPreset.faction
                                  ? 'pink'
                                  : 'white',
                            }}
                          >
                            {data.selected_faction}
                          </span>
                        }
                        onSelected={(selected_faction) => {
                          act('set_selected_faction', {
                            selected_faction: selected_faction,
                            path: chosenPreset.path,
                          });
                        }}
                      />
                    </Stack.Item>
                    <Button.Checkbox
                      checked={data.spawn_ai}
                      onClick={() => {
                        act('human_spawn_ai_toggle');
                      }}
                    >
                      AI
                    </Button.Checkbox>
                    <Button.Checkbox
                      checked={data.paradrop}
                      onClick={() => {
                        act('paradrop_toggle');
                      }}
                    >
                      Parachute
                    </Button.Checkbox>
                    <Dropdown
                      options={data.equipment_settings}
                      selected={data.selected_equipment}
                      displayText={
                        <span
                          style={{
                            color:
                              data.selected_equipment === 'Birthday Suit'
                                ? 'pink'
                                : data.selected_equipment !== 'Full Equipment'
                                  ? 'orange'
                                  : 'white',
                          }}
                        >
                          {data.selected_equipment}
                        </span>
                      }
                      onSelected={(selected_equipment) => {
                        act('set_selected_equipment', {
                          selected_equipment: selected_equipment,
                          path: chosenPreset.path,
                        });
                      }}
                    />
                  </Stack>
                ) : (
                  <div />
                )}
              </Section>
            </Stack.Item>
          </Stack>
        </Stack>
      </Window.Content>
    </Window>
  );
};
