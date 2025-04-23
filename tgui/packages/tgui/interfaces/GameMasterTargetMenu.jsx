import { useBackend } from '../backend';
import { Button, Collapsible, Divider, Section, Stack } from '../components';
import { Window } from '../layouts';

export const GameMastertargetMenu = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Window width={400} height={250}>
      <Window.Content scrollable>
        <Stack direction="column" grow>
          <GameMastertargetPanel />
        </Stack>
      </Window.Content>
    </Window>
  );
};

export const GameMastertargetPanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="target" mb={1}>
      <Stack direction="column">
        <Stack.Item>
          <Button
            ml={1}
            selected={data.target_click_intercept}
            onClick={() => {
              act('toggle_click_target');
            }}
          >
            Click target
          </Button>
        </Stack.Item>
        {data.game_master_targets && (
          <Stack.Item>
            <Collapsible title="CAS Target Points">
              <Stack vertical>
                {data.game_master_targets.map((val) => {
                  if (val) {
                    return (
                      <Stack.Item key={val.target_name}>
                        <Divider />
                        <Stack>
                          <Stack.Item align="center">
                            <Button
                              onClick={() => {
                                act('jump_to_target', { val });
                              }}
                            >
                              {val.target_name}
                            </Button>
                          </Stack.Item>
                          <Stack.Item>
                            <Button
                              color="bad"
                              onClick={() => {
                                act('remove_target', { val });
                              }}
                            >
                              X
                            </Button>
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
