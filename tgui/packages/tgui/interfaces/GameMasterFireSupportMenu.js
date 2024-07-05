import { useBackend } from '../backend';
import { Button, Collapsible, LabeledList, Section } from '../components';
import { Window } from '../layouts';

export const GameMasterFireSupportMenu = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window resizable>
      <Window.Content scrollable>
        <Section title="Fire Support Menu">
          <LabeledList>
            <LabeledList.Item>
              <Button
                ml={1}
                selected={data.fire_support_click_intercept}
                content="Call Fire Support"
                onClick={() => {
                  act('toggle_click_fire_support');
                }}
              />

              <Collapsible content="Missiles">
                {data.missile_ordnance_options.map((ordnance, i) => (
                  <Button
                    content={ordnance}
                    selected={data.selected_ordnance === ordnance}
                    key={i}
                    width={'130px'}
                    onClick={() => {
                      act('set_selected_ordnance', { ordnance });
                    }}
                  />
                ))}
              </Collapsible>

              <Collapsible content="Orbital Bombardments">
                {data.orbital_ordnance_options.map((ordnance, i) => (
                  <Button
                    content={ordnance}
                    selected={data.selected_ordnance === ordnance}
                    key={i}
                    width={'130px'}
                    onClick={() => {
                      act('set_selected_ordnance', { ordnance });
                    }}
                  />
                ))}
              </Collapsible>

              <Collapsible content="Mortar Shells">
                {data.mortar_ordnance_options.map((ordnance, i) => (
                  <Button
                    content={ordnance}
                    selected={data.selected_ordnance === ordnance}
                    key={i}
                    width={'130px'}
                    onClick={() => {
                      act('set_selected_ordnance', { ordnance });
                    }}
                  />
                ))}
              </Collapsible>

              <Collapsible content="Misc Ordnance">
                {data.misc_ordnance_options.map((ordnance, i) => (
                  <Button
                    content={ordnance}
                    selected={data.selected_ordnance === ordnance}
                    key={i}
                    width={'130px'}
                    onClick={() => {
                      act('set_selected_ordnance', { ordnance });
                    }}
                  />
                ))}
              </Collapsible>
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
