import { BooleanLike, classes } from 'common/react';
import { useState } from 'react';

import { useBackend } from '../backend';
import {
  Box,
  Button,
  Collapsible,
  Divider,
  Dropdown,
  Section,
  Stack,
} from '../components';
import { Window } from '../layouts';

type Defense = {
  name: string;
  path: string;
  description: string;
  image: string;
  uses_faction: BooleanLike;
  uses_turned_on: BooleanLike;
};

type BackendContext = {
  valid_factions: string[];
  defenses: { [key: string]: Defense[] };
};

export const HumanDefenseManager = (props) => {
  const { data, act } = useBackend<BackendContext>();
  const { defenses, valid_factions } = data;
  const [chosenDefense, setDefense] = useState<Defense | null>(null);
  const [chosenFaction, setFaction] = useState<string>('USCM');
  const [turnedOn, setTurnedOn] = useState<BooleanLike>(true);
  const [placeDir, setPlaceDir] = useState<string>('');
  return (
    <Window title="Human Defense Creator" width={800} height={900}>
      <Window.Content>
        <Stack fill vertical>
          <Stack fill>
            <Stack.Item grow mr={1}>
              <Section fill height="100%">
                {Object.keys(defenses).map((dictKey) => (
                  <Collapsible title={dictKey} key={dictKey} color="good">
                    {defenses[dictKey].map((defense) => (
                      <div style={{ paddingBottom: '12px' }} key={defense.path}>
                        <Button
                          fontSize="15px"
                          textAlign="center"
                          selected={defense === chosenDefense}
                          width="100%"
                          key={defense.path}
                          onClick={() => setDefense(defense)}
                        >
                          {defense.name}
                        </Button>
                      </div>
                    ))}
                  </Collapsible>
                ))}
              </Section>
            </Stack.Item>
            <Divider vertical />
            <Stack.Item width="30%">
              <Section title="Selected Defense">
                {chosenDefense !== null && (
                  <Stack vertical>
                    <Stack.Item>
                      <div
                        style={{
                          display: 'flex',
                          justifyContent: 'center',
                          alignItems: 'center',
                        }}
                      >
                        <Box key={chosenDefense.path}>
                          <span
                            className={classes([
                              'defensemenu128x128',
                              `${chosenDefense.image}`,
                            ])}
                          />
                        </Box>
                      </div>
                    </Stack.Item>
                    <Stack.Item>{chosenDefense.description}</Stack.Item>
                    <Stack.Item>
                      <div style={{ textAlign: 'center' }}>
                        <div
                          style={{
                            display: 'inline-block',
                            verticalAlign: 'middle',
                          }}
                        >
                          <Button.Checkbox
                            onClick={() => setTurnedOn(!turnedOn)}
                            checked={turnedOn}
                            disabled={!chosenDefense.uses_turned_on}
                          >
                            Turned On
                          </Button.Checkbox>
                        </div>
                        <div
                          style={{
                            display: 'inline-block',
                            verticalAlign: 'middle',
                          }}
                        >
                          <Dropdown
                            options={valid_factions}
                            selected={chosenFaction}
                            onSelected={(value) => setFaction(value)}
                            width={10}
                            disabled={!chosenDefense.uses_faction}
                          />
                        </div>
                        <div
                          style={{
                            display: 'inline-block',
                            verticalAlign: 'middle',
                          }}
                        >
                          <Dropdown
                            options={[
                              'Default',
                              'North',
                              'East',
                              'South',
                              'West',
                            ]}
                            selected={placeDir}
                            onSelected={(value) => setPlaceDir(value)}
                            width={10}
                            placeholder="Direction..."
                          />
                        </div>
                      </div>
                    </Stack.Item>
                    <Stack.Item>
                      <Button
                        textAlign="center"
                        width="100%"
                        onClick={() =>
                          act('create_defense', {
                            path: chosenDefense.path,
                            turned_on: turnedOn,
                            faction: chosenFaction,
                            place_dir: placeDir,
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
