import { useBackend } from '../backend';
import { Flex, Dropdown, Button, Section, Slider } from '../components';
import { Window } from '../layouts';

export const GameMaster = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Window width={400} height={400}>
      <Window.Content scrollable>
        <Flex grow direction="column">
          <Flex.Item>
            <Section title="Spawning">
              <Flex grow direction="column">
                <Flex.Item>
                  <Flex grow>
                    <Flex.Item>
                      <Button.Input
                        minWidth={4}
                        minHeight={2}
                        content={data.xeno_spawn_count}
                        currentValue={data.xeno_spawn_count}
                        onCommit={(e, value) => {
                          act('set_xeno_spawns', { value });
                        }}
                      />
                    </Flex.Item>
                    <Flex.Item>
                      <Dropdown
                        options={data.spawnable_xenos}
                        selected={data.selected_xeno}
                        onSelected={(new_xeno) => {
                          act('set_selected_xeno', { new_xeno });
                        }}
                      />
                    </Flex.Item>
                  </Flex>
                </Flex.Item>
                <Flex.Item>
                  <Flex grow>
                    <Flex.Item>
                      <Button.Checkbox
                        checked={data.spawn_ai}
                        content="AI"
                        onClick={() => {
                          act('xeno_spawn_ai_toggle');
                        }}
                      />
                    </Flex.Item>
                    <Flex.Item>
                      <Button
                        selected={data.spawn_click_intercept}
                        content="Click Spawn"
                        onClick={() => {
                          act('toggle_click_spawn');
                        }}
                      />
                    </Flex.Item>
                  </Flex>
                </Flex.Item>
                <Flex.Item>
                  <Button
                    content="Delete all xenos"
                    onClick={() => {
                      act('delete_all_xenos');
                    }}
                  />
                </Flex.Item>
              </Flex>
            </Section>
          </Flex.Item>
          <Flex.Item>
            <Section title="Objectives">
              <Flex grow>
            <Section title="Objective">
              <Flex direction="column">
                <Flex.Item>
                  <Button
                    selected={data.objective_click_intercept}
                    content="Click Objective"
                    onClick={() => {
                      act('toggle_click_objective');
                    }}
                  />
                </Flex.Item>
                {data.game_master_objectives && (
                  <Flex.Item>
                    <Collapsible title="Objectives">
                      <Stack vertical>
                        {data.game_master_objectives.map((val) => {
                          if (val) {
                            return (
                              <Stack.Item>
                                <Divider />
                                <Flex>
                                  <Flex.Item align="center">
                                    <Button
                                      content={val.object_name}
                                      onClick={() => {
                                        act('jump_to', { val });
                                      }}
                                    />
                                  </Flex.Item>
                                  <Flex.Item
                                    grow
                                    pl={1}
                                    py={0.25}
                                    fontSize="12px">
                                    {val.objective_info}
                                  </Flex.Item>
                                </Flex>
                              </Stack.Item>
                            );
                          }
                        })}
                        <Divider />
                      </Stack>
                    </Collapsible>
                  </Flex.Item>
                )}
              </Flex>
            </Section>
          </Flex.Item>
          <Flex.Item>
            <Section title="Communication">
              <Flex grow direction="column">
                <Flex.Item>
                  <Button
                    content="Game Master Phone"
                    onClick={() => {
                      act('use_game_master_phone');
                    }}
                  />
                </Flex.Item>
                <Flex.Item>Communication Clarity</Flex.Item>
                <Flex.Item>
                  <Slider
                    maxValue={100}
                    minValue={0}
                    value={data.communication_clarity}
                    suppressFlicker={2500}
                    onChange={(e, clarity) => {
                      act('set_communication_clarity', { clarity });
                    }}
                  />
                </Flex.Item>
              </Flex>
            </Section>
          </Flex.Item>
        </Flex>
      </Window.Content>
    </Window>
  );
};
