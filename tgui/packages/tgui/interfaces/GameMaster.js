import { useBackend } from '../backend';
import { Dropdown, Button, Section, Slider, Collapsible, Stack, Divider } from '../components';
import { Window } from '../layouts';

export const GameMaster = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Window width={400} height={400}>
      <Window.Content scrollable>
        <Stack direction="column">
          <Section title="Spawning">
            <Stack direction="column">
              <Stack.Item>
                <Stack>
                  <Stack.Item>
                    <Button.Input
                      ml={1}
                      minWidth={3.5}
                      minHeight={1.5}
                      content={data.xeno_spawn_count}
                      currentValue={data.xeno_spawn_count}
                      onCommit={(e, value) => {
                        act('set_xeno_spawns', { value });
                      }}
                    />
                  </Stack.Item>
                  <Stack.Item>
                    <Dropdown
                      options={data.spawnable_xenos}
                      selected={data.selected_xeno}
                      onSelected={(new_xeno) => {
                        act('set_selected_xeno', { new_xeno });
                      }}
                    />
                  </Stack.Item>
                </Stack>
              </Stack.Item>
              <Stack.Item>
                <Stack>
                  <Stack.Item>
                    <Button.Checkbox
                      checked={data.spawn_ai}
                      content="AI"
                      onClick={() => {
                        act('xeno_spawn_ai_toggle');
                      }}
                    />
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      selected={data.spawn_click_intercept}
                      content="Click Spawn"
                      onClick={() => {
                        act('toggle_click_spawn');
                      }}
                    />
                  </Stack.Item>
                </Stack>
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Delete all xenos"
                  onClick={() => {
                    act('delete_all_xenos');
                  }}
                />
              </Stack.Item>
            </Stack>
          </Section>
          <Section title="Objective">
            <Stack direction="column">
              <Stack.Item>
                <Button
                  ml={1}
                  selected={data.objective_click_intercept}
                  content="Click Objective"
                  onClick={() => {
                    act('toggle_click_objective');
                  }}
                />
              </Stack.Item>
              {data.game_master_objectives && (
                <Stack.Item>
                  <Collapsible title="Objectives">
                    <Stack vertical>
                      {data.game_master_objectives.map((val) => {
                        if (val) {
                          return (
                            <Stack.Item>
                              <Divider />
                              <Stack>
                                <Stack.Item align="center">
                                  <Button
                                    content={val.object_name}
                                    onClick={() => {
                                      act('jump_to', { val });
                                    }}
                                  />
                                </Stack.Item>
                                <Stack.Item
                                  grow
                                  pl={1}
                                  py={0.25}
                                  fontSize="12px">
                                  {val.objective_info}
                                </Stack.Item>
                              </Stack>
                            </Stack.Item>
                          );
                        }
                      })}
                      <Divider />
                    </Stack>
                  </Collapsible>
                </Stack.Item>
              )}
            </Stack>
          </Section>
          <Section title="Communication">
            <Stack direction="column">
              <Stack.Item>
                <Button
                  ml={1}
                  content="Game Master Phone"
                  onClick={() => {
                    act('use_game_master_phone');
                  }}
                />
              </Stack.Item>
              <Stack.Item>Communication Clarity</Stack.Item>
              <Stack.Item>
                <Slider
                  maxValue={100}
                  minValue={0}
                  value={data.communication_clarity}
                  suppressFlicker={2500}
                  onChange={(e, clarity) => {
                    act('set_communication_clarity', { clarity });
                  }}
                />
              </Stack.Item>
            </Stack>
          </Section>
        </Stack>
      </Window.Content>
    </Window>
  );
};
