import { useState } from 'react';

import { useBackend } from '../backend';
import {
  Box,
  Button,
  Collapsible,
  Divider,
  NumberInput,
  Section,
  Stack,
} from '../components';
import { Window } from '../layouts';

type AIEquipmentPreset = {
  name: string;
  path: string;
  description: string;
};

type BackendContext = {
  presets: { [key: string]: AIEquipmentPreset[] };
  zombieDelimbMulti: number;
  randomHelmet: boolean;
  helmetChance: number;
};

export const HumanAISpawner = (props) => {
  const { data, act } = useBackend<BackendContext>();
  const [chosenPreset, setPreset] = useState<AIEquipmentPreset | null>(null);
  const { zombieDelimbMulti } = data;
  const [newZombieDelimbMulti, setZombieDelimbMulti] = useState<number | null>(
    zombieDelimbMulti,
  );
  const { randomHelmet } = data;
  const [randomHelmetChecked, setRandomHelmetChecked] =
    useState<boolean>(randomHelmet);
  const { helmetChance } = data;
  const [newHelmetChance, setNewHelmetChance] = useState<number>(helmetChance);
  const { presets } = data;

  const flipRandomHelmetChecked = () => {
    if (randomHelmetChecked) {
      setRandomHelmetChecked(false);
    } else {
      setRandomHelmetChecked(true);
    }
  };
  const numberToTwoDP = (value) => {
    setZombieDelimbMulti(value.toFixed(2));
  };
  return (
    <Window title="Human AI Spawner" width={800} height={900}>
      <Window.Content>
        <Stack fill vertical>
          <Stack fill>
            <Stack.Item grow mr={1}>
              <Section fill scrollable>
                {Object.keys(presets).map((dictKey) => (
                  <Collapsible title={dictKey} key={dictKey} color="good">
                    {presets[dictKey].map((squad) => (
                      <Box pb={'12px'} key={squad.path}>
                        <Button
                          fontSize="15px"
                          textAlign="center"
                          selected={squad === chosenPreset}
                          width="100%"
                          key={squad.path}
                          onClick={() => setPreset(squad)}
                        >
                          {squad.name}
                        </Button>
                      </Box>
                    ))}
                  </Collapsible>
                ))}
              </Section>
            </Stack.Item>
            <Divider vertical />
            <Stack.Item width="30%">
              <Section title="Selected Preset">
                {chosenPreset !== null ? (
                  <Stack vertical>
                    <Stack.Item>{chosenPreset.description}</Stack.Item>
                    <Stack.Item>
                      <Button
                        textAlign="center"
                        width="100%"
                        onClick={() =>
                          act('create_ai', {
                            path: chosenPreset.path,
                            zombieDelimbMulti: newZombieDelimbMulti,
                            randomHelmet: randomHelmetChecked,
                            helmetChance: newHelmetChance,
                          })
                        }
                      >
                        Spawn
                      </Button>
                    </Stack.Item>
                    {chosenPreset.path.match('zombie') !== null ? (
                      <Stack.Item>
                        <Stack.Item align="center" textAlign="center">
                          <Box>Zombie Delimbing Multiplier:</Box>
                          <Button tooltip="This value will change a delimb modifier that is applied to the spawned zombie. 1 is defualt. 0.5 would half the chance. 2 would double it. Understand that you're affecting the probabilty as a percentage chance. Values beyond 0.5 and 1.5 Aren't recommended.">
                            ?
                          </Button>
                          <NumberInput
                            value={
                              newZombieDelimbMulti ? newZombieDelimbMulti : 1
                            }
                            step={0.01}
                            minValue={0}
                            maxValue={20}
                            onChange={(value) => numberToTwoDP(value)}
                            width="75px"
                          />
                          <Button
                            icon="undo"
                            onClick={() => setZombieDelimbMulti(null)}
                          />
                          <Button.Checkbox
                            checked={randomHelmetChecked}
                            onClick={() => flipRandomHelmetChecked()}
                          >
                            Random <i>Zombie Helmet</i> Chance?
                          </Button.Checkbox>

                          <Button tooltip="This value will change the chance for a zombie to spawn with head protection in 0-100%. Helmets give One expendable decap protection, and these will have hands and feet protection baked in, rest of the body should be covered by armoured presets.">
                            ?
                          </Button>
                          <NumberInput
                            value={newHelmetChance}
                            step={1}
                            minValue={0}
                            maxValue={100}
                            onChange={(value) => setNewHelmetChance(value)}
                            width="75px"
                          />
                          <Button
                            icon="undo"
                            onClick={() => setNewHelmetChance(25)}
                          />
                        </Stack.Item>
                      </Stack.Item>
                    ) : (
                      <div />
                    )}
                  </Stack>
                ) : (
                  <div />
                )}
              </Section>
            </Stack.Item>
          </Stack>
        </Stack>
      </Window.Content>
    </Window>
  );
};
