import { useBackend } from '../backend';
import { Button, Dropdown, Section, Stack } from '../components';
import { Window } from '../layouts';

export const GameMasterSubmenuAmbush = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Window width={400} height={400}>
      <Window.Content scrollable>
        <Stack direction="column" vertical>
          <GameMasterSubmenuAmbushSpawningPanel />

          <GameMasterSubmenuAmbushAmbushPanel />

          <GameMasterSubmenuAmbushMiscPanel />
        </Stack>
      </Window.Content>
    </Window>
  );
};

export const GameMasterSubmenuAmbushSpawningPanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="Spawning">
      <Stack direction="column" vertical>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Button.Input
                minWidth={2}
                minHeight={1.75}
                currentValue={data.xeno_spawn_count}
                onCommit={(e, value) => {
                  act('set_xeno_spawns', { value });
                }}
              >
                {data.xeno_spawn_count}
              </Button.Input>
            </Stack.Item>
            <Stack.Item>
              <Dropdown
                options={data.spawnable_xenos}
                selected={data.selected_xeno}
                onSelected={(new_xeno) => {
                  act('set_selected_xeno', { new_xeno });
                }}
                menuWidth="10rem"
                width="10rem"
              />
            </Stack.Item>
            <Stack.Item>
              <Dropdown
                options={data.spawnable_hives}
                selected={data.selected_hive}
                onSelected={(new_hive) => {
                  act('set_selected_hive', { new_hive });
                }}
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Button
            middle
            onClick={() => {
              act('spawn');
            }}
          >
            Spawn Now
          </Button>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const GameMasterSubmenuAmbushAmbushPanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="Ambush">
      <Stack direction="column" vertical>
        <Stack.Item>
          <Button
            middle
            onClick={() => {
              act('ambush');
            }}
          >
            Set Ambush
          </Button>
        </Stack.Item>
        <Stack.Item>
          <Button
            middle
            onClick={() => {
              act('clear_ambush');
            }}
          >
            Clear Ambush
          </Button>
        </Stack.Item>
        <Stack.Item>{data.ambush_info}</Stack.Item>
      </Stack>
    </Section>
  );
};

export const GameMasterSubmenuAmbushMiscPanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="Misc">
      <Stack direction="column" vertical>
        <Stack.Item>
          <Button
            middle
            onClick={() => {
              act('shake_spawner');
            }}
          >
            Shake Spawner
          </Button>
        </Stack.Item>
      </Stack>
    </Section>
  );
};
