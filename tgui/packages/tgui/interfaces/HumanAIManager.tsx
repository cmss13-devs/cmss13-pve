import { useBackend, useLocalState } from '../backend';
import { Button, Section, Stack, Divider } from '../components';
import { Window } from '../layouts';
import { BooleanLike } from 'common/react';

type Squad = {
  id: number;
  order: string;
  members: string;
  ref: string;
  primary_order: string;
  squad_leader: string;
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
  const [squadAssignmentMode, setSquadAssignmentMode] = useLocalState(
    'squad_assignment_mode',
    false,
  );
  const [orderAssignmentMode, setOrderAssignmentMode] = useLocalState(
    'order_assignment_mode',
    false,
  );
  return (
    <Stack fill vertical>
      <div>
        <div
          style={{
            float: 'left',
            display: 'inline-block',
            'padding-right': '6px',
          }}
        >
          <Button content="New Squad" onClick={() => act('create_squad')} />
        </div>
        <div
          style={{
            float: 'left',
            display: 'inline-block',
            'padding-right': '6px',
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
            'padding-right': '6px',
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
          <CreatedOrder order={order} id={order.ref} />
        ))}
      </div>
      <Divider />
      <div>
        {data.ai_humans.map((human) => (
          <HumanAIReadout human={human} id={human.ref} />
        ))}
      </div>
      <Divider />
      <div>
        {data.squads.map((squad) => (
          <SquadReadout squad={squad} id={squad.ref} />
        ))}
      </div>
    </Stack>
  );
};

const CreatedOrder = (props) => {
  const order: Order = props.order;
  const context: BackendContext = props.context;
  const { data, act } = useBackend<BackendContext>();
  const [orderAssignmentMode, setOrderAssignmentMode] = useLocalState(
    'order_assignment_mode',
    false,
  );
  const [selectedSquad, setSelectedSquad] = useLocalState('selected_squad', -1);
  return (
    <div
      style={{
        float: 'left',
        display: 'inline-block',
        'padding-right': '6px',
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
          <div>
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
  const [squadAssignmentMode, setSquadAssignmentMode] = useLocalState(
    'squad_assignment_mode',
    false,
  );
  const [selectedSquad, setSelectedSquad] = useLocalState('selected_squad', -1);
  const { data, act } = useBackend<BackendContext>();
  const gottenSquad: Squad = data.squads[selectedSquad];
  return (
    <div
      style={{
        float: 'left',
        display: 'inline-block',
        'padding-right': '6px',
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
                  human.squad_id == selectedSquad ||
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
                  gottenSquad.squad_leader == human.name
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
  const [squadAssignmentMode, setSquadAssignmentMode] = useLocalState(
    'squad_assignment_mode',
    false,
  );
  const [selectedSquad, setSelectedSquad] = useLocalState('selected_squad', -1);
  const [orderAssignmentMode, setOrderAssignmentMode] = useLocalState(
    'order_assignment_mode',
    false,
  );
  return (
    <div
      style={{
        float: 'left',
        display: 'inline-block',
        'padding-right': '6px',
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
