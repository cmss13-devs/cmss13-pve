import { useBackend } from '../backend';
import { Stack, Dropdown, Button, Section } from '../components';
import { Window } from '../layouts';

export const GameMasterSubmenuVents = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Window width={400} height={400}>
      <Window.Content scrollable>
        <Stack direction="column" vertical>
          <GameMasterSubmenuVentsSpawningPanel />

          <GameMasterSubmenuVentsAmbushPanel />

          <GameMasterSubmenuVentsMiscPanel />
        </Stack>
      </Window.Content>
    </Window>
  );
};

export const GameMasterSubmenuVentsSpawningPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Spawning">
      <Stack direction="column" vertical>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Button.Input
                minWidth={2}
                minHeight={1.75}
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
          <Button
            middle
            content="Spawn Now"
            onClick={() => {
              act('spawn');
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const GameMasterSubmenuVentsAmbushPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Ambush">
      <Stack direction="column" vertical>
        <Stack.Item>
          <Button
            middle
            content="Set Ambush"
            onClick={() => {
              act('ambush');
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            middle
            content="Clear Ambush"
            onClick={() => {
              act('clear_ambush');
            }}
          />
        </Stack.Item>
        <Stack.Item>{data.ambush_info}</Stack.Item>
      </Stack>
    </Section>
  );
};

export const GameMasterSubmenuVentsMiscPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Misc">
      <Stack direction="column" vertical>
        <Stack.Item>
          <Button
            middle
            content="Shake Vent"
            onClick={() => {
              act('shake_vent');
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};
