import { useBackend } from '../backend';
import { Button, Dropdown, LabeledList, Section } from '../components';
import { Window } from '../layouts';

export const GameMasterFireSupportMenu = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window resizable>
      <Window.Content scrollable>
        <Section title="Fire Support Menu">
          <LabeledList>
            <LabeledList.Item label="Fire Support">
              <Button
                ml={1}
                selected={data.fire_support_click_intercept}
                content="Call Fire Support"
                onClick={() => {
                  act('toggle_click_fire_support');
                }}
              />
              <Dropdown
                options={data.ordnance_options}
                selected={data.selected_ordnance}
                width="200px"
                content="Select Ordnance"
                onSelected={(new_ordnance) => {
                  act('set_selected_ordnance', { new_ordnance });
                }}
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
