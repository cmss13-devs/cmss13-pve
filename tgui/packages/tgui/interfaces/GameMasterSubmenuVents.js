import { useBackend } from '../backend';
import { Stack, Dropdown, Button } from '../components';
import { Window } from '../layouts';

export const GameMasterSubmenuVents = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Window width={400} height={400}>
      <Window.Content scrollable>
        <Stack grow direction="column" vertical>
          <Stack.Item>
            <Stack grow>
              <Stack.Item>
                <Button.Input
                  fluid
                  middle
                  content="###"
                  onCommit={(e, value) => {
                    act('set_xeno_spawns', { value });
                  }}
                />
              </Stack.Item>
              <Stack.Item grow>
                <Dropdown
                  options={data.spawnable_xenos}
                  selected={data.default_spawnable_xeno_string}
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
      </Window.Content>
    </Window>
  );
};
