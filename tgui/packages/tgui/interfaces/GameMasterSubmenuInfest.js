import { useBackend } from '../backend';
import { Stack, Dropdown, Button, Section, Slider } from '../components';
import { Window } from '../layouts';

export const GameMasterSubmenuInfest = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Window width={400} height={400}>
      <Window.Content scrollable>
        <Stack direction="column" vertical>
          <GameMasterSubmenuInfestInfestingPanel />
        </Stack>
      </Window.Content>
    </Window>
  );
};

export const GameMasterSubmenuInfestInfestingPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Infesting">
      <Stack direction="column" vertical>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Dropdown
                options={data.selectable_hives}
                selected={data.selected_hive}
                width="15rem"
                onSelected={(new_hive) => {
                  act('set_selected_hive', { new_hive });
                }}
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item mt={1}>Embryo Stage</Stack.Item>
        <Stack.Item>
          <Slider
            maxValue={5}
            minValue={0}
            stepPixelSize={40}
            value={data.embryo_stage}
            onChange={(e, stage) => {
              act('set_embryo_stage', { stage });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Button
                middle
                content="Set"
                onClick={() => {
                  act('infest');
                }}
              />
            </Stack.Item>
            <Stack.Item>
              <Button
                middle
                content="Clear"
                onClick={() => {
                  act('clear_infest');
                }}
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Button
            middle
            content="Burst Now"
            onClick={() => {
              act('burst');
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};
