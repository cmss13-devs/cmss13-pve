import { useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Button, Section, Stack, Tabs, TextArea } from 'tgui/components';
import { Window } from 'tgui/layouts';

type Data = {
  general: string;
  head: string;
  face: string;
  eyes: string;
  torso: string;
  arms: string;
  hands: string;
  legs: string;
  helmet: string;
  armor: string;
};

export const FlavorTextEditor = (props) => {
  const { act, data } = useBackend<Data>();
  const { general, head, face, eyes, torso, arms, hands, legs, helmet, armor } =
    data;
  const [category, setCategory] = useState('general');
  const [flavorText, setFlavorText] = useState(general);
  const [buffer, setBuffer] = useState(general);
  const changeCategory = (category, text) => {
    setCategory(category);
    setFlavorText(text);
    setBuffer(text);
  };

  const save = (buffer, category, flavorText) => {
    setFlavorText(buffer);
    act('set_flavor_text', {
      category: category,
      text: buffer,
    });
  };

  return (
    <Window width={800} height={500} theme="crtblue">
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            <Tabs fluid pr="0" pl="0" mb="0" fontSize="16px">
              <Tabs.Tab
                selected={category === 'general'}
                onClick={() => changeCategory('general', general)}
              >
                General
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'head'}
                onClick={() => changeCategory('head', head)}
              >
                Head
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'face'}
                onClick={() => changeCategory('face', face)}
              >
                Face
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'eyes'}
                onClick={() => changeCategory('eyes', eyes)}
              >
                Eyes
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'torso'}
                onClick={() => changeCategory('torso', torso)}
              >
                Torso
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'arms'}
                onClick={() => changeCategory('arms', arms)}
              >
                Arms
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'hands'}
                onClick={() => changeCategory('hands', hands)}
              >
                Hands
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'legs'}
                onClick={() => changeCategory('legs', legs)}
              >
                Legs
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'helmet'}
                onClick={() => changeCategory('helmet', helmet)}
              >
                Helmet
              </Tabs.Tab>
              <Tabs.Tab
                selected={category === 'armor'}
                onClick={() => changeCategory('armor', armor)}
              >
                Armor
              </Tabs.Tab>
            </Tabs>
          </Stack.Item>
          <Section
            fill
            title={
              'Edit ' + category + ' flavor text (Shift+Enter for new line)'
            }
            buttons={
              <>
                <Button
                  icon="floppy-disk"
                  onClick={() => save(buffer, category, flavorText)}
                >
                  Save
                </Button>
                <Button icon="undo" onClick={() => setBuffer(flavorText)}>
                  Revert
                </Button>
              </>
            }
          >
            <TextArea
              scrollbar
              height="100%"
              fontSize="13px"
              value={buffer}
              onChange={(e, value) => setBuffer(value)}
            />
          </Section>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const TextInput = ({ buffer, setBuffer }) => {
  return (
    <TextArea
      scrollbar
      height="100%"
      fontSize="13px"
      value={buffer}
      onChange={(e, value) => setBuffer(value)}
    />
  );
};
