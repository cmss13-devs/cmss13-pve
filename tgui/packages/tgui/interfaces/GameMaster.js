import { useBackend } from '../backend';
import { Flex, Dropdown, Button, Section } from '../components';
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
                    <Flex.Item grow>
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
              </Flex>
            </Section>
          </Flex.Item>
          <Flex.Item>
            <Section title="Objectives">
              <Flex grow>
                <Flex.Item>
                  <Button
                    selected={data.objective_click_intercept}
                    content="Click Objective"
                    onClick={() => {
                      act('toggle_click_objective');
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
