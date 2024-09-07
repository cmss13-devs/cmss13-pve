import { useBackend, useLocalState } from '../backend';
import { Box, Button, LabeledList, NoticeBox, ProgressBar, Section, Dimmer, Stack, Tabs, Divider } from '../components';
import { Window } from '../layouts';
import { InterfaceLockNoticeBox } from './common/InterfaceLockNoticeBox';
import { classes, BooleanLike } from 'common/react';

type Squad = {
  id: number;
  orders: string;
  members: string;
  ref: string;
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
  const { data, act } = useBackend<BackendContext>(context);
  const [categoryIndex, setCategoryIndex] = useLocalState(
    context,
    'category_index',
    'Farewell'
  );
  return (
    <Stack fill vertical>
      <div>
        <div
          style={{
            'float': 'left',
            'display': 'inline-block',
            'padding-right': '6px',
          }}>
          <Button content="New Squad" onClick={() => act('create_squad')} />
        </div>
        <div
          style={{
            'float': 'left',
            'display': 'inline-block',
            'padding-right': '6px',
          }}>
          <Button content="New Squad" onClick={() => act('create_squad')} />
        </div>
      </div>
      <Divider />
      <div>
        {data.orders.map((order) => (
          <CreatedOrder order={order} context={context} id={order.ref} />
        ))}
      </div>
      <Divider />
      <div>
        {data.ai_humans.map((human) => (
          <HumanAIReadout human={human} context={context} id={human.ref} />
        ))}
      </div>
      <Divider />
      <div>
        {data.squads.map((squad) => (
          <SquadReadout squad={squad} context={context} id={squad.ref} />
        ))}
      </div>
    </Stack>
  );
};

const CreatedOrder = (props) => {
  const order: Order = props.order;
  const context: BackendContext = props.context;
  const { data, act } = useBackend<BackendContext>(context);
  return (
    <div
      style={{
        'float': 'left',
        'display': 'inline-block',
        'padding-right': '6px',
      }}>
      <Section title={`${order.name}`}>
        <Button
          content="VV"
          tooltip={order.ref}
          onClick={() =>
            act('view_variables', {
              ref: order.ref,
            })
          }
        />
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
  const { data, act } = useBackend<BackendContext>(context);
  return (
    <div
      style={{
        'float': 'left',
        'display': 'inline-block',
        'padding-right': '6px',
      }}>
      <Section title={`${human.name}`}>
        <div>
          <Button
            content="VV (H)"
            tooltip={human.ref}
            onClick={() =>
              act('view_variables', {
                ref: human.ref,
              })
            }
            style={{
              'float': 'left',
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
              'float': 'left',
            }}
          />
        </div>
        <br />
        <br />
        Health: {human.health}% <br />
        Faction: {human.faction} <br />
        In Combat: {human.in_combat} <br />
        Squad #: {human.squad} <br />
        Loc: {human.loc[0]}, {human.loc[1]}, {human.loc[2]}
      </Section>
    </div>
  );
};

const SquadReadout = (props) => {
  const squad: Squad = props.squad;
  const context: BackendContext = props.context;
  const { data, act } = useBackend<BackendContext>(context);
  return (
    <div
      style={{
        'float': 'left',
        'display': 'inline-block',
        'padding-right': '6px',
      }}>
      <Section title={`${squad.id}`}>
        <Button
          content="VV"
          tooltip={squad.ref}
          onClick={() =>
            act('view_variables', {
              ref: squad.ref,
            })
          }
        />
        <br />
        <br />
        Members: {squad.members} <br />
        Orders: {squad.orders}
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
