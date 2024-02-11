import { useBackend } from '../backend';
import { Dropdown, Button, Section, Slider, Collapsible, Stack, Divider } from '../components';
import { Window } from '../layouts';

export const GameMaster = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Window width={650} height={500}>
      <Window.Content scrollable>
        <Stack direction="column" grow>
          <GameMasterSpawningPanel />

          <GameMasterBehaviorPanel />

          <GameMasterObjectivePanel />

          <GameMasterCommunicationPanel />
        </Stack>
      </Window.Content>
    </Window>
  );
};

export const GameMasterSpawningPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
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
            <Stack.Item>
              <Dropdown
                options={data.spawnable_hives}
                selected={data.selected_hive}
                width="15rem"
                onSelected={(new_hive) => {
                  act('set_selected_hive', { new_hive });
                }}
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Stack>
            <Stack.Item>Delay (s)</Stack.Item>
            <Stack.Item>
              <Button.Input
                ml={1}
                minWidth={6}
                minHeight={1.5}
                content={data.xeno_spawn_delay}
                currentValue={data.xeno_spawn_delay}
                onCommit={(e, value) => {
                  act('set_xeno_spawn_delay', { value });
                }}
              />
            </Stack.Item>
            <Stack.Item>
              <Button.Checkbox
                checked={data.xeno_spawn_looping}
                content="Looping"
                onClick={() => {
                  act('xeno_spawn_looping_toggle');
                }}
              />
            </Stack.Item>
            <Stack.Item>
              <Button.Checkbox
                checked={data.xeno_spawn_fail_human}
                content="Fail spawn if humans nearby"
                onClick={() => {
                  act('xeno_spawn_fail_human_toggle');
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
          <Stack>
            <Stack.Item>
              <Button
                content="Delete all xenos"
                onClick={() => {
                  act('delete_all_xenos');
                }}
              />
            </Stack.Item>
            <Stack.Item>
              <Button
                content="Delete viewed xenos"
                onClick={() => {
                  act('delete_xenos_in_view');
                }}
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        {data.xeno_spawners && (
          <Stack.Item>
            <Collapsible title="Spawners">
              <Stack vertical>
                {data.xeno_spawners.map((spawner) => {
                  if (spawner) {
                    let spawner_ref = spawner.ref;
                    return (
                      <Stack.Item>
                        <Stack direction="column">
                          <Divider />
                          <Stack.Item>Caste: {spawner.spawn_type}</Stack.Item>
                          <Stack.Item>Count: {spawner.spawn_count}</Stack.Item>
                          <Stack.Item>Delay: {spawner.spawn_delay}s</Stack.Item>
                          <Stack.Item>
                            Looping: {spawner.looping ? 'True' : 'False'}
                          </Stack.Item>
                          <Stack.Item>
                            Fail if human within {spawner.fail_range}:{' '}
                            {spawner.fail_human ? 'True' : 'False'}
                          </Stack.Item>
                          <Stack.Item>
                            <Stack vertical>
                              <Stack.Item>
                                <Button
                                  content="Jump To"
                                  onClick={() => {
                                    act('jump_to_spawner', { spawner_ref });
                                  }}
                                />
                              </Stack.Item>
                              <Stack.Item>
                                <Button
                                  content="Delete"
                                  onClick={() => {
                                    act('delete_spawner', { spawner_ref });
                                  }}
                                />
                              </Stack.Item>
                            </Stack>
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
  );
};

export const GameMasterBehaviorPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Special Behaviors">
      <Stack direction="column">
        <Stack.Item>
          <Dropdown
            ml={1}
            options={data.selectable_behaviors}
            selected={data.selected_behavior}
            onSelected={(new_behavior) => {
              act('set_selected_behavior', { new_behavior });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            selected={data.behavior_click_intercept}
            content="Click Behavior"
            onClick={() => {
              act('toggle_click_behavior');
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const GameMasterObjectivePanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Objective" mb={1}>
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
                          <Stack.Item>
                            <Button
                              content="X"
                              color="bad"
                              onClick={() => {
                                act('remove_objective', { val });
                              }}
                            />
                          </Stack.Item>
                          <Stack.Item grow pl={1} py={0.25} fontSize="12px">
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
  );
};

export const GameMasterCommunicationPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
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
        <Stack.Item mt={1}>Communication Clarity</Stack.Item>
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
  );
};
