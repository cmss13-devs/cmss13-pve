import { useState } from 'react';

import { useBackend } from '../backend';
import { Button, Collapsible, Divider, Section, Stack } from '../components';
import { Window } from '../layouts';

type Squad = {
  name: string;
  path: string;
  description: string;
  contents: string[];
};

type BackendContext = {
  squads: { [key: string]: Squad[] };
};

export const HumanSquadSpawner = (props) => {
  const { data, act } = useBackend<BackendContext>();
  const [chosenSquad, setSquad] = useState<Squad | null>(null);
  const { squads } = data;
  return (
    <Window title="Human Squad Spawner" width={800} height={900}>
      <Window.Content>
        <Stack fill vertical>
          <Stack fill>
            <Stack.Item grow mr={1}>
              <Section fill scrollable>
                {Object.keys(squads).map((dictKey) => (
                  <Collapsible title={dictKey} key={dictKey} color="good">
                    {squads[dictKey].map((squad) => (
                      <div style={{ paddingBottom: '12px' }} key={squad.path}>
                        <Button
                          fontSize="15px"
                          textAlign="center"
                          selected={squad === chosenSquad}
                          width="100%"
                          key={squad.path}
                          onClick={() => setSquad(squad)}
                        >
                          {squad.name}
                        </Button>
                      </div>
                    ))}
                  </Collapsible>
                ))}
              </Section>
            </Stack.Item>
            <Divider vertical />
            <Stack.Item width="30%">
              <Section title="Selected Squad">
                {chosenSquad !== null && (
                  <Stack vertical>
                    <Stack.Item>{chosenSquad.description}</Stack.Item>
                    <Stack.Item>
                      Contains:
                      {chosenSquad.contents.map((content) => (
                        <div key={content}>{content}</div>
                      ))}
                    </Stack.Item>
                    <Stack.Item>
                      <Button
                        textAlign="center"
                        width="100%"
                        onClick={() =>
                          act('create_squad', {
                            path: chosenSquad.path,
                          })
                        }
                      >
                        Spawn
                      </Button>
                    </Stack.Item>
                  </Stack>
                )}
              </Section>
            </Stack.Item>
          </Stack>
        </Stack>
      </Window.Content>
    </Window>
  );
};
