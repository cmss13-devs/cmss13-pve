import { useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Input, Stack, Tabs } from 'tgui/components';
import { Window } from 'tgui/layouts';

type Data = {
  general: string;
  armor: string;
};

export const FlavorTextEditor = (props) => {
  const { act, data } = useBackend<Data>();
  const { general, armor } = data;
  const [category, setCategory] = useState('general');
  const [input, setInput] = useState(general);
  const setBoth = (category, text) => {
    setCategory(category);
    setInput(text);
  };

  return (
    <Window width={800} height={500} theme="crtblue">
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            <Tabs fluid fontSize="16px">
              <Tabs.Tab
                selected={category === 'general'}
                onClick={() => setBoth('general', general)}
              >
                General
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'armor'}
                onClick={() => setBoth('armor', armor)}
              >
                Armor
              </Tabs.Tab>
            </Tabs>
          </Stack.Item>
          <Stack.Item>
            <Input
              width="100%"
              height="200px"
              fontSize="13px"
              value={input}
              onChange={(e, value) =>
                act('set_flavor_text', {
                  category: category,
                  text: value,
                })
              }
            />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
