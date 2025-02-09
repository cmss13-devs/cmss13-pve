import { BooleanLike } from 'common/react';
import { useState } from 'react';

import { useBackend } from '../backend';
import { Button, Divider, Section, Stack } from '../components';
import { Window } from '../layouts';

type Squad = {
  id: number;
  order: string;
  members: string;
  ref: string;
  squad_leader: string;
  name: string;
};

type AIHuman = {
  name: string;
  health: number;
  loc: number[];
  faction: string;
  ref: string;
  brain_ref: string;
  in_combat: BooleanLike;
  squad_id: number;
  can_assign_squad: BooleanLike;
};

type Order = {
  name: string;
  type: string;
  data: any[];
  ref: string;
};

type BackendContext = {
  orders: Order[];
  ai_humans: AIHuman[];
  squads: Squad[];
};

const AIContext = (props, context) => {
  const { data, act } = useBackend<BackendContext>();
  const [squadAssignmentMode, setSquadAssignmentMode] = useState(false);
  const [orderAssignmentMode, setOrderAssignmentMode] = useState(false);
  const [selectedSquad, setSelectedSquad] = useState(-1);
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
          <Button content="New Squad" onClick={() => act('create_squad')} />
        </div>
        <div
          style={{
            float: 'left',
            display: 'inline-block',
            paddingRight: '6px',
          }}
        >
          <Button
            content="Squad Assignment Mode"
            onClick={() => {
              setSquadAssignmentMode(!squadAssignmentMode);
              setOrderAssignmentMode(false);
            }}
            color={squadAssignmentMode ? 'green' : 'red'}
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
            content="Order Assignment Mode"
            onClick={() => {
              setSquadAssignmentMode(false);
              setOrderAssignmentMode(!orderAssignmentMode);
            }}
            color={orderAssignmentMode ? 'green' : 'red'}
          />
        </div>
      </div>
      <Divider />
      <div>
        {data.orders.map((order) => (
          <CreatedOrder
            order={order}
            key={order.ref}
            selectedSquad={selectedSquad}
            orderAssignmentMode={orderAssignmentMode}
            squadAssignmentMode={squadAssignmentMode}
          />
        ))}
      </div>
      <Divider />
      <div>
        {data.ai_humans.map((human) => (
          <HumanAIReadout
            human={human}
            key={human.ref}
            selectedSquad={selectedSquad}
            orderAssignmentMode={orderAssignmentMode}
            squadAssignmentMode={squadAssignmentMode}
          />
        ))}
      </div>
      <Divider />
      <div>
        {data.squads.map((squad) => (
          <SquadReadout
            squad={squad}
            key={squad.ref}
            selectedSquad={selectedSquad}
            orderAssignmentMode={orderAssignmentMode}
            squadAssignmentMode={squadAssignmentMode}
            setSelectedSquad={setSelectedSquad}
          />
        ))}
      </div>
    </Stack>
  );
};

const CreatedOrder = (props) => {
  const order: Order = props.order;
  const { data, act } = useBackend<BackendContext>();
  const orderAssignmentMode: boolean = props.orderAssignmentMode;
  const selectedSquad = props.selectedSquad;
  return (
    <div
      style={{
        float: 'left',
        display: 'inline-block',
        paddingRight: '6px',
      }}
    >
      <Section title={`${order.name}`}>
        {orderAssignmentMode ? (
          <>
            <Button
              content="Assign"
              tooltip="Assign order to selected squad"
              onClick={() =>
                act('assign_order', {
                  order: order.ref,
                  squad: selectedSquad,
                })
              }
              color="green"
              disabled={selectedSquad === -1}
              style={{
                float: 'left',
              }}
            />
            <Button.Confirm
              color="red"
              confirmContent="Confirm?"
              onClick={() =>
                act('delete_object', {
                  ref: order.ref,
                })
              }
            >
              Del
            </Button.Confirm>
            <br />
            <br />
          </>
        ) : (
          <>
            <Button
              content="VV"
              tooltip={order.ref}
              onClick={() =>
                act('view_variables', {
                  ref: order.ref,
                })
              }
            />
            <Button.Confirm
              color="red"
              confirmContent="Confirm?"
              onClick={() =>
                act('delete_object', {
                  ref: order.ref,
                })
              }
            >
              Del
            </Button.Confirm>
          </>
        )}
        {order.data[0].map((data_name, i) => (
          <div key={data_name}>
            {data_name}: {order.data[1][i]}
          </div>
        ))}
      </Section>
    </div>
  );
};

const HumanAIReadout = (props) => {
  const human: AIHuman = props.human;
  const context: BackendContext = props.context;
  const squadAssignmentMode = props.squadAssignmentMode;
  const selectedSquad = props.selectedSquad;
  const { data, act } = useBackend<BackendContext>();
  const gottenSquad: Squad = data.squads[selectedSquad];
  return (
    <div
      style={{
        float: 'left',
        display: 'inline-block',
        paddingRight: '6px',
      }}
    >
      <Section title={`${human.name}`}>
        <div>
          {squadAssignmentMode ? (
            <>
              <Button
                content="Assign"
                tooltip="Assign AI to selected squad"
                onClick={() =>
                  act('assign_to_squad', {
                    ai: human.brain_ref,
                    squad: selectedSquad,
                  })
                }
                color="green"
                disabled={
                  selectedSquad === -1 ||
                  human.squad_id === selectedSquad ||
                  !human.can_assign_squad
                }
                style={{
                  float: 'left',
                }}
              />
              <Button
                content="SL"
                tooltip="Set this AI to be the squad leader of its squad."
                onClick={() =>
                  act('assign_sl', {
                    ai: human.brain_ref,
                    squad: selectedSquad,
                  })
                }
                color={
                  gottenSquad !== undefined &&
                  gottenSquad.squad_leader === human.name
                    ? 'green'
                    : 'red'
                }
                disabled={selectedSquad === human.squad_id ? false : true}
                style={{
                  float: 'left',
                }}
              />
            </>
          ) : (
            <>
              <Button
                content="JMP"
                onClick={() =>
                  act('jump_to', {
                    ref: human.ref,
                  })
                }
              />
              <Button
                content="VV (H)"
                tooltip={human.ref}
                onClick={() =>
                  act('view_variables', {
                    ref: human.ref,
                  })
                }
                style={{
                  float: 'left',
                }}
              />
              <br />
              <Button
                content="VV (B)"
                tooltip={human.brain_ref}
                onClick={() =>
                  act('view_variables', {
                    ref: human.brain_ref,
                  })
                }
                style={{
                  float: 'left',
                }}
              />
              <Button.Confirm
                color="red"
                confirmContent="Confirm?"
                onClick={() => {
                  act('delete_object', {
                    ref: human.brain_ref,
                  });
                  act('delete_object', {
                    ref: human.ref,
                  });
                }}
              >
                Del
              </Button.Confirm>
            </>
          )}
        </div>
        <br />
        <br />
        Health: {human.health}% <br />
        Faction: {human.faction} <br />
        In Combat: {human.in_combat} <br />
        Squad #: {human.squad_id} <br />
        Loc: {human.loc[0]}, {human.loc[1]}, {human.loc[2]}
      </Section>
    </div>
  );
};

const SquadReadout = (props) => {
  const squad: Squad = props.squad;
  const context: BackendContext = props.context;
  const { data, act } = useBackend<BackendContext>();
  const squadAssignmentMode = props.squadAssignmentMode;
  const selectedSquad = props.selectedSquad;
  const setSelectedSquad = props.setSelectedSquad;
  const orderAssignmentMode: boolean = props.orderAssignmentMode;
  return (
    <div
      style={{
        float: 'left',
        display: 'inline-block',
        paddingRight: '6px',
      }}
    >
      <Section title={`${squad.id}`}>
        {squadAssignmentMode || orderAssignmentMode ? (
          <Button
            content="Select"
            tooltip={squad.ref}
            onClick={() => setSelectedSquad(squad.id)}
            color={squad.id === selectedSquad ? 'green' : 'red'}
          />
        ) : (
          <Button
            content="VV"
            tooltip={squad.ref}
            onClick={() =>
              act('view_variables', {
                ref: squad.ref,
              })
            }
          />
        )}
        <Button
          content="Rename"
          tooltip={'Set squad name, visible to GMs.'}
          onClick={() =>
            act('rename_squad', {
              squad: squad.id,
            })
          }
        />
        <Button.Confirm
          color="red"
          confirmContent="Confirm?"
          onClick={() =>
            act('delete_object', {
              ref: squad.ref,
            })
          }
        >
          Del
        </Button.Confirm>
        <br />
        <br />
        Members: {squad.members} <br />
        Order: {squad.order} <br />
        Squad Leader: {squad.squad_leader}
      </Section>
    </div>
  );
};

export const HumanAIManager = (props) => {
  return (
    <Window width={1850} height={610} title="Human AI Manager">
      <Window.Content>
        <AIContext />
      </Window.Content>
    </Window>
  );
};
