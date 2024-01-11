import { useBackend } from '../backend';
import { Button, Section, Collapsible, Stack, Divider } from '../components';
import { Window } from '../layouts';

export const GameMasterRappelMenu = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Window width={400} height={250}>
      <Window.Content scrollable>
        <Stack direction="column" grow>
          <GameMasterRappelPanel />
        </Stack>
      </Window.Content>
    </Window>
  );
};

export const GameMasterRappelPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Rappel" mb={1}>
      <Stack direction="column">
        <Stack.Item>
          <Button
            ml={1}
            selected={data.rappel_click_intercept}
            content="Click Rappel"
            onClick={() => {
              act('toggle_click_rappel');
            }}
          />
        </Stack.Item>
        {data.game_master_rappels && (
          <Stack.Item>
            <Collapsible title="Rappel Points">
              <Stack vertical>
                {data.game_master_rappels.map((val) => {
                  if (val) {
                    return (
                      <Stack.Item>
                        <Divider />
                        <Stack>
                          <Stack.Item align="center">
                            <Button
                              content={val.rappel_name}
                              onClick={() => {
                                act('jump_to_rappel', { val });
                              }}
                            />
                          </Stack.Item>
                          <Stack.Item>
                            <Button
                              content="X"
                              color="bad"
                              onClick={() => {
                                act('remove_rappel', { val });
                              }}
                            />
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
