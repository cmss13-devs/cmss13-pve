import { useBackend, useLocalState } from '../backend';
import { Stack, Section, Tabs, Input, Button } from '../components';
import { Window } from '../layouts';

export const PhoneMenu = (props) => {
  const { act, data } = useBackend();
  return (
    <Window width={500} height={400}>
      <Window.Content>
        <GeneralPanel />
      </Window.Content>
    </Window>
  );
};

const GeneralPanel = (props) => {
  const { act, data } = useBackend();
  const { do_not_disturb } = data;
  const available_phones = Object.keys(data.available_phones);
  const phones = data.phones.filter((val1) =>
    available_phones.includes(val1.phone_id)
  );

  const [currentSearch, setSearch] = useLocalState('current_search', '');

  const [selectedPhone, setSelectedPhone] = useLocalState(
    'selected_phone',
    null
  );

  const categories = [];
  for (let i = 0; i < phones.length; i++) {
    let data = phones[i];
    if (categories.includes(data.phone_category)) continue;

    categories.push(data.phone_category);
  }

  const [currentCategory, setCategory] = useLocalState(
    'current_category',
    categories[0]
  );

  let dnd_tooltip = 'Do Not Disturb is DISABLED';
  let dnd_locked = 'No';
  let dnd_icon = 'volume-high';
  if (do_not_disturb === 1) {
    dnd_tooltip = 'Do Not Disturb is ENABLED';
    dnd_icon = 'volume-xmark';
  } else if (do_not_disturb >= 2) {
    dnd_tooltip = 'Do Not Disturb is ENABLED (LOCKED)';
    dnd_locked = 'Yes';
    dnd_icon = 'volume-xmark';
  } else if (do_not_disturb < 0) {
    dnd_tooltip = 'Do Not Disturb is DISABLED (LOCKED)';
    dnd_locked = 'Yes';
  }

  return (
    <Section fill>
      <Stack vertical fill>
        <Stack.Item>
          <Tabs>
            {categories.map((val) => (
              <Tabs.Tab
                selected={val === currentCategory}
                onClick={() => setCategory(val)}
                key={val}>
                {val}
              </Tabs.Tab>
            ))}
          </Tabs>
        </Stack.Item>
        <Stack.Item>
          <Input
            fluid
            value={currentSearch}
            placeholder="Search for a phone"
            onInput={(e, value) => setSearch(value.toLowerCase())}
          />
        </Stack.Item>
        <Stack.Item grow>
          <Section fill scrollable onComponentDidMount={(node) => node.focus()}>
            <Tabs vertical>
              {phones.map((val) => {
                if (
                  val.phone_category !== currentCategory ||
                  !val.phone_id.toLowerCase().match(currentSearch)
                ) {
                  return;
                }
                return (
                  <Tabs.Tab
                    selected={selectedPhone === val.phone_id}
                    onClick={() => {
                      if (selectedPhone === val.phone_id) {
                        act('call_phone', { phone_id: selectedPhone });
                      } else {
                        setSelectedPhone(val.phone_id);
                      }
                    }}
                    key={val.phone_id}
                    color={val.phone_color}
                    onFocus={() =>
                      document.activeElement
                        ? document.activeElement.blur()
                        : false
                    }
                    icon={val.phone_icon}>
                    {val.phone_id}
                  </Tabs.Tab>
                );
              })}
            </Tabs>
          </Section>
        </Stack.Item>
        {!!selectedPhone && (
          <Stack.Item>
            <Button
              content="Dial"
              color="good"
              fluid
              textAlign="center"
              onClick={() => act('call_phone', { phone_id: selectedPhone })}
            />
          </Stack.Item>
        )}
        <Stack.Item>
          <Button
            content="Do Not Disturb"
            color="red"
            tooltip={dnd_tooltip}
            disabled={dnd_locked === 'Yes'}
            icon={dnd_icon}
            fluid
            textAlign="center"
            onClick={() => act('toggle_do_not_disturb')}
          />
        </Stack.Item>
        {data.virtual_phone && (
          <Stack.Item>
            <Stack vertical fill>
              <Stack.Item>
                <Section title={data.calling_phone_id || 'Phone Control'} />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Pick Up"
                  color="good"
                  fluid
                  textAlign="center"
                  disabled={!data.being_called}
                  onClick={() => act('pick_up')}
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Hang Up"
                  color="red"
                  fluid
                  textAlign="center"
                  disabled={!data.active_call}
                  onClick={() => act('hang_up')}
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
        )}
      </Stack>
    </Section>
  );
};
