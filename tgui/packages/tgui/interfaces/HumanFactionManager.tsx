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
    <Stack fill vertical>
      <div>
        <div
          style={{
            float: 'left',
            display: 'inline-block',
            paddingRight: '6px',
          }}
        >
          <Dropdown
            selected={selectedToCreateFaction}
            options={data.datumless_factions}
            onSelected={(value) => setSelectedToCreateFaction(value)}
          />
        </div>
        <div
          style={{
            float: 'left',
            display: 'inline-block',
            paddingRight: '6px',
          }}
        >
          <Button
            content="Create Faction Datum"
            onClick={() => {
              act('create_faction', {
                faction: selectedToCreateFaction,
              });
              setSelectedToCreateFaction('');
            }}
          />
        </div>
      </div>
      <Divider />
      <div>
        {data.factions.map((faction) => (
          <ExistingFaction faction={faction} key={faction.ref} />
        ))}
      </div>
    </Stack>
  );
};

const ExistingFaction = (props) => {
  const context: BackendContext = props.context;
  const { data, act } = useBackend<BackendContext>();
  const faction: Faction = props.faction;
  return (
    <div
      style={{
        float: 'left',
        display: 'inline-block',
        paddingRight: '6px',
        paddingBottom: '6px',
      }}
    >
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
        Friendly Factions: {faction.friendly_factions}
        <>
          <Button
            content="Add"
            onClick={() =>
              act('add_friendly_faction', {
                faction: faction.name,
              })
            }
            style={{
              float: 'left',
            }}
          />
          <Button
            content="Remove"
            onClick={() =>
              act('remove_friendly_faction', {
                faction: faction.name,
              })
            }
            style={{
              float: 'left',
            }}
          />
        </>
        <br />
        <br />
        Neutral Factions: {faction.neutral_factions}
        <>
          <Button
            content="Add"
            onClick={() =>
              act('add_neutral_faction', {
                faction: faction.name,
              })
            }
            style={{
              float: 'left',
            }}
          />
          <Button
            content="Remove"
            onClick={() =>
              act('remove_neutral_faction', {
                faction: faction.name,
              })
            }
            style={{
              float: 'left',
            }}
          />
        </>
      </Section>
    </div>
  );
};

export const HumanFactionManager = (props) => {
  return (
    <Window width={1850} height={610} title="Human Faction Manager">
      <Window.Content>
        <FactionContext />
      </Window.Content>
    </Window>
  );
};
