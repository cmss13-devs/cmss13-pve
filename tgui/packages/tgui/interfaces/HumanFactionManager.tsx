import { BooleanLike } from 'common/react';
import { useState } from 'react';

import { useBackend } from '../backend';
import { Button, Divider, Dropdown, Section, Stack } from '../components';
import { Window } from '../layouts';

type Faction = {
  name: string;
  shoot_to_kill: BooleanLike;
  friendly_factions: string;
  neutral_factions: string;
  ref: string;
};

type BackendContext = {
  factions: Faction[];
  all_factions: string[];
  datumless_factions: string[];
};

const FactionContext = (props, context) => {
  const { data, act } = useBackend<BackendContext>();
  const [selectedToCreateFaction, setSelectedToCreateFaction] = useState('');
  return (
    <Stack vertical>
      <Stack.Item>
        <Dropdown
          selected={selectedToCreateFaction}
          options={data.datumless_factions}
          onSelected={(value) => setSelectedToCreateFaction(value)}
        />
        <Button
          onClick={() => {
            act('create_faction', {
              faction: selectedToCreateFaction,
            });
            setSelectedToCreateFaction('');
          }}
        >
          Create Faction Datum
        </Button>
      </Stack.Item>
      <Divider />
      <Stack fill justify="space-around" align="baseline" wrap>
        {data.factions.map((faction) => (
          <ExistingFaction faction={faction} key={faction.ref} />
        ))}
      </Stack>
    </Stack>
  );
};

const ExistingFaction = (props) => {
  const context: BackendContext = props.context;
  const { data, act } = useBackend<BackendContext>();
  const faction: Faction = props.faction;
  return (
    <Stack.Item width="300px">
      <Section title={`${faction.name}`}>
        Shoot To Kill: {faction.shoot_to_kill}
        <Dropdown
          selected={`${faction.shoot_to_kill}`}
          placeholder={`${faction.shoot_to_kill}`}
          options={['0', '1']}
          onSelected={(value) =>
            act('set_shoot_to_kill', {
              faction_name: faction.name,
              new_value: value,
            })
          }
        />
        <Stack vertical>
          <Stack.Item>
            <Button
              inline
              onClick={() =>
                act('add_friendly_faction', {
                  faction: faction.name,
                })
              }
            >
              Add
            </Button>
            <Button
              inline
              onClick={() =>
                act('remove_friendly_faction', {
                  faction: faction.name,
                })
              }
            >
              Remove
            </Button>
            Friendly Factions: {faction.friendly_factions}
          </Stack.Item>
          <Stack.Item>
            <Button
              onClick={() =>
                act('add_neutral_faction', {
                  faction: faction.name,
                })
              }
            >
              Add
            </Button>
            <Button
              onClick={() =>
                act('remove_neutral_faction', {
                  faction: faction.name,
                })
              }
            >
              Remove
            </Button>
            Neutral Factions: {faction.neutral_factions}
          </Stack.Item>
        </Stack>
      </Section>
    </Stack.Item>
  );
};

export const HumanFactionManager = (props) => {
  return (
    <Window width={1850} height={610} title="Human Faction Manager">
      <Window.Content>
        <Section fill scrollable>
          <FactionContext />
        </Section>
      </Window.Content>
    </Window>
  );
};
