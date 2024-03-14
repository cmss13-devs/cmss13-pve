import { useBackend, useLocalState } from '../backend';
import { Button, Section, Slider, Stack, Tabs } from '../components';
import { Window } from '../layouts';

export const MapManipulation = (props, context) => {
  const [main_tab, setTab] = useLocalState(context, 'main_tab', 1);
  const { data } = useBackend(context);

  return (
    <Window title="Map Manipulator" width={420} height={420}>
      <Window.Content scrollable>
        <Tabs>
          <Tabs.Tab
            selected={main_tab === 1}
            onClick={() => setTab(1)}
            color={'red'}
            icon="bomb">
            Destruction
          </Tabs.Tab>
          {!!data.map_specific_options && (
            <Tabs.Tab
              selected={main_tab === 2}
              onClick={() => setTab(2)}
              color={'white'}
              icon="screwdriver-wrench">
              Map-Specific
            </Tabs.Tab>
          )}
        </Tabs>
        {main_tab === 1 && <DestructionTab />}
        {main_tab === 2 && <MapSpecificTab />}
      </Window.Content>
    </Window>
  );
};

export const DestructionTab = (props, context) => {
  const [dest_tab, setTab] = useLocalState(context, 'dest_tab', 1);
  const { data, act } = useBackend(context);

  return (
    <Stack direction="column" grow>
      <ParametersPanel />
      <PresetsPanel />
      <Tabs>
        <Tabs.Tab
          selected={dest_tab === 1}
          onClick={() => setTab(1)}
          icon="plug">
          Machines
        </Tabs.Tab>
        <Tabs.Tab
          selected={dest_tab === 2}
          onClick={() => setTab(2)}
          icon="tower-observation">
          Structures
        </Tabs.Tab>
        <Tabs.Tab
          selected={dest_tab === 3}
          onClick={() => setTab(3)}
          icon="building">
          Turfs
        </Tabs.Tab>
        <Tabs.Tab
          selected={dest_tab === 4}
          onClick={() => setTab(4)}
          icon="hand-holding">
          Items
        </Tabs.Tab>
      </Tabs>
      {dest_tab === 1 && <DestroyMachinesTab />}
      {dest_tab === 2 && <DestroyStructuresTab />}
      {dest_tab === 3 && <DestroyTurfsTab />}
      {dest_tab === 4 && <DestroyItemsTab />}
    </Stack>
  );
};

export const ParametersPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Destruction Parameters">
      <Stack>
        <Stack.Item>
          <Button.Input
            tooltip="The Z-Level that will be affected."
            content={data.selected_z_level}
            currentValue={data.selected_z_level}
            onCommit={(e, z_value) => {
              act('selected_z_level', { z_value });
            }}
          />
        </Stack.Item>
        <Stack.Item grow={1}>
          <Slider
            value={data.percentage_to_break}
            minValue={0}
            maxValue={100}
            ranges={{
              'green': [0, 25],
              'yellow': [26, 50],
              'orange': [51, 75],
              'red': [76, 100],
            }}
            step={5}
            stepPixelSize={20}
            suppressFlicker={2500}
            onChange={(e, percentage) => {
              act('percentage_to_break', { percentage });
            }}
            fluid>
            Destruction Ratio: {data.percentage_to_break}%
          </Slider>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const PresetsPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Batch Presets (Ignores Ratio)">
      <Stack textAlign="center">
        <Stack.Item grow={1}>
          <Button
            fluid
            content="Light"
            tooltip="Keep most items intact."
            onClick={() => {
              act('preset_light_damage', {
                map_destruction: 1,
                batch_damage: 1,
              });
            }}
          />
        </Stack.Item>
        <Stack.Item grow={1}>
          <Button
            fluid
            content="Medium"
            tooltip="Does some turf damage too and light item deletion."
            onClick={() => {
              act('preset_moderate_damage', {
                map_destruction: 1,
                batch_damage: 2,
              });
            }}
          />
        </Stack.Item>
        <Stack.Item grow={1}>
          <Button
            fluid
            content="Heavy"
            tooltip="More of everything and also more dirt."
            onClick={() => {
              act('preset_heavy_damage', {
                map_destruction: 1,
                batch_damage: 3,
              });
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const DestroyMachinesTab = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Machine Destruction (Fast)">
      <Stack direction="row" wrap="wrap">
        <Stack.Item>
          <Button
            ml={1}
            color="orange"
            content="ALL Machines (INCONSISTENT | ~50%))"
            tooltip="/obj/structure/machinery"
            onClick={() => {
              act('break_all_machines', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="CM Vendors"
            tooltip="/obj/structure/machinery/cm_vending"
            onClick={() => {
              act('break_gear_vendors', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Normal Vendors"
            tooltip="/obj/structure/machinery/vending"
            onClick={() => {
              act('break_normal_vendors', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Computers and Terminals"
            tooltip="/obj/structure/machinery/computer"
            onClick={() => {
              act('break_computers', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="APCs"
            tooltip="/obj/structure/machinery/power/apc"
            onClick={() => {
              act('break_apcs', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Lights"
            tooltip="/obj/structure/machinery/light"
            onClick={() => {
              act('break_lights', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Cameras"
            tooltip="/obj/structure/machinery/camera"
            onClick={() => {
              act('break_cameras', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Comm Towers"
            tooltip="/obj/structure/machinery/telecomms/relay/preset/tower"
            onClick={() => {
              act('break_comms_towers', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Airlocks (Break or Seal)"
            tooltip="/obj/obj/structure/machinery/door/airlock"
            onClick={() => {
              act('break_airlocks', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const DestroyStructuresTab = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Structure Destruction (Slower)">
      <Stack direction="row" wrap="wrap">
        <Stack.Item>
          <Button
            ml={1}
            color="red"
            content="ALL Structures (INCONSISTENT | ~50% | DANGEROUS)"
            tooltip="/obj/structure"
            onClick={() => {
              act('break_all_structures', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Gun Racks"
            tooltip="/obj/structure/gun_rack"
            onClick={() => {
              act('break_gun_racks', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            ml={1}
            content="Mirrors"
            tooltip="/obj/structure/mirror"
            onClick={() => {
              act('break_mirrors', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Grilles"
            tooltip="/obj/structure/grille"
            onClick={() => {
              act('break_grilles', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Fences"
            tooltip="/obj/structure/fence"
            onClick={() => {
              act('break_fences', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Barricades"
            tooltip="/obj/structure/barricade"
            onClick={() => {
              act('damage_barricades', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Windows"
            tooltip="/obj/structure/window"
            onClick={() => {
              act('break_windows', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Window Frames"
            tooltip="/obj/structure/window_frame"
            onClick={() => {
              act('break_window_frames', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Chairs | Beds"
            tooltip="/obj/structure/bed"
            onClick={() => {
              act('break_chairs_and_beds', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Tables (Destroy or Flip)"
            tooltip="/obj/structure/surface/table"
            onClick={() => {
              act('break_tables', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Lockers"
            tooltip="/obj/structure/closet"
            onClick={() => {
              act('break_lockers', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Large Crates"
            tooltip="/obj/structure/closet"
            onClick={() => {
              act('break_large_crates', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Racks"
            tooltip="/obj/structure/surface/rack"
            onClick={() => {
              act('break_racks', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Reagent Tanks"
            tooltip="/obj/structure/reagent_dispensers"
            onClick={() => {
              act('break_reagent_tanks', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Powerloaders"
            tooltip="/obj/vehicle/powerloader"
            onClick={() => {
              act('break_powerloaders', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const DestroyTurfsTab = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Turf Destruction (Slowest)">
      <Stack direction="row" wrap="wrap">
        <Stack.Item>
          <Button
            ml={1}
            content="Walls (With Bullet Holes)"
            tooltip="/turf/wall"
            onClick={() => {
              act('damage_walls', { map_destruction: 1, bullet_holes: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Walls (No Bullet Holes)"
            tooltip="/turf/wall"
            onClick={() => {
              act('damage_walls', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Floors"
            tooltip="/turf/open/floor"
            onClick={() => {
              act('damage_floors', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Floors + Pipes/Disposal"
            tooltip="/turf/open/floor"
            onClick={() => {
              act('damage_floors', { map_destruction: 1, break_pipes: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Add Dirt Only"
            tooltip="/turf/open/floor"
            onClick={() => {
              act('damage_floors', { add_dirt: 1 });
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const DestroyItemsTab = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Item Deletion (Medium)">
      <Stack direction="row" wrap="wrap">
        <Stack.Item>
          <Button
            ml={1}
            color="yellow"
            content="ALL Items"
            tooltip="/obj/item"
            onClick={() => {
              act('destroy_all_items', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Guns"
            tooltip="/obj/item/weapon/gun"
            onClick={() => {
              act('destroy_guns', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Ammo Mags"
            tooltip="/obj/item/ammo_magazine"
            onClick={() => {
              act('destroy_ammo', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Other Weapons (No Guns)"
            tooltip="/obj/item/weapon"
            onClick={() => {
              act('destroy_weapons', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Devices"
            tooltip="/obj/item/device"
            onClick={() => {
              act('destroy_devices', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Storage Items"
            tooltip="/obj/item/storage"
            onClick={() => {
              act('destroy_item_storage', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Clothing/Equippables"
            tooltip="/obj/item/clothing"
            onClick={() => {
              act('destroy_clothing', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Reagent Containers"
            tooltip="/obj/item/reagent_container"
            onClick={() => {
              act('destroy_reagent_containers', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Food Only"
            tooltip="/obj/item/reagent_container/food"
            onClick={() => {
              act('destroy_food', { map_destruction: 1 });
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

// Tabs without tabs. map_name is fed from the back-end, so it's always a single panel.
// If you're adding maps, just toss them in with their own panels.
// Probably much better ways of doing this, but this will suffice for now.

export const MapSpecificTab = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Stack direction="column" grow>
      <MapSelectionPanel />
      {data.map_name === 'Blackstone Bridge' && <BlackstonePanel />}
    </Stack>
  );
};

export const MapSelectionPanel = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Map Selection">
      <Stack textAlign="center">
        <Stack.Item grow={1}>
          <Button
            fluid
            icon="globe"
            selected={data.selected_map === 'ground_map'}
            content="Ground Map"
            tooltip="Selects the ground map."
            onClick={() => {
              act('selected_map', {
                chosen_map: 'ground_map',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item grow={1}>
          <Button
            fluid
            icon="rocket"
            selected={data.selected_map === 'ship_map'}
            content="Ship Map"
            tooltip="Selects the ship map."
            onClick={() => {
              act('selected_map', {
                chosen_map: 'ship_map',
              });
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const BlackstonePanel = (props, context) => {
  const [bstone_tab, setTab] = useLocalState(context, 'bstone_tab', 1);
  const { data, act } = useBackend(context);

  return (
    <Stack direction="column" grow>
      <Tabs>
        <Tabs.Tab
          selected={bstone_tab === 1}
          onClick={() => setTab(1)}
          icon="square-full">
          Blockers
        </Tabs.Tab>
        <Tabs.Tab
          selected={bstone_tab === 2}
          onClick={() => setTab(2)}
          icon="helmet-safety">
          Maintenance
        </Tabs.Tab>
      </Tabs>
      {bstone_tab === 1 && <BlackstoneBlockersTab />}
      {bstone_tab === 2 && <BlackstoneMaintenanceTab />}
    </Stack>
  );
};

export const BlackstoneBlockersTab = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Cave Blockers">
      <Stack direction="row" wrap="wrap">
        <Stack.Item>
          <Button
            ml={1}
            content="Toggle Debris (Mining)"
            tooltip="Near the mining site."
            onClick={() => {
              act('blackstone_toggle_blocker', {
                blocker_id: 'cave_blocker_1',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle Debris (BBall)"
            tooltip="Near the basketball court."
            onClick={() => {
              act('blackstone_toggle_blocker', {
                blocker_id: 'cave_blocker_2',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle Debris (Pillbox)"
            tooltip="Near the SW pillbox."
            onClick={() => {
              act('blackstone_toggle_blocker', {
                blocker_id: 'cave_blocker_3',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle Debris (Jungle)"
            tooltip="Near the SW jungle."
            onClick={() => {
              act('blackstone_toggle_blocker', {
                blocker_id: 'cave_blocker_4',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle Tunnel Gates"
            tooltip="Toggles the podlocks that block the mountain tunnel."
            onClick={() => {
              act('blackstone_toggle_gate', {
                gate_to_open: 'tunnel_gate_main',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle LZ Gates"
            tooltip="Toggles the podlocks that block off the landing zone."
            onClick={() => {
              act('blackstone_toggle_gate', {
                gate_to_open: 'tunnel_gate_lz',
              });
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const BlackstoneMaintenanceTab = (props, context) => {
  const { data, act } = useBackend(context);

  return (
    <Section title="Maintenance Options">
      <Stack direction="row" wrap="wrap">
        <Stack.Item>
          <Button
            ml={1}
            content="Toggle ALL Hatches"
            tooltip="Toggles all *maintenance* hatch locks; if they were open, closes them."
            onClick={() => {
              act('blackstone_toggle_hatch', {
                hatch_to_unlock: 'toggle_all',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle LZ Hatch"
            tooltip="Toggles the hatch next to the landing zone."
            onClick={() => {
              act('blackstone_toggle_hatch', {
                hatch_to_unlock: 'landingzone_hatch',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle East Hatch"
            tooltip="Toggles the eastern hatch, next to the road."
            onClick={() => {
              act('blackstone_toggle_hatch', {
                hatch_to_unlock: 'east_hatch',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle NW Hatch"
            tooltip="Toggles the NW hatch, next to the CIC."
            onClick={() => {
              act('blackstone_toggle_hatch', {
                hatch_to_unlock: 'north_west_hatch',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle West Hatch"
            tooltip="Toggles the western hatch, next to CO's office."
            onClick={() => {
              act('blackstone_toggle_hatch', {
                hatch_to_unlock: 'west_hatch',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle SE Hatch"
            tooltip="Toggles the SE hatch, above the warehouse storage area."
            onClick={() => {
              act('blackstone_toggle_hatch', {
                hatch_to_unlock: 'south_east_hatch',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle West Hatch"
            tooltip="Toggles the SW hatch, above the warehouse checkpoint vestibule."
            onClick={() => {
              act('blackstone_toggle_hatch', {
                hatch_to_unlock: 'south_west_hatch',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Toggle Bunker Hatch"
            tooltip="Toggles the hidden bunker hatch, which spawns somewhere in the jungle."
            onClick={() => {
              act('blackstone_toggle_hatch', {
                hatch_to_unlock: 'blackstone_hidden_bunker',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Flicker Lights NE"
            tooltip="Flickers some lightbulbs in that maintenance area for a short, random interval."
            onClick={() => {
              act('blackstone_flicker_light', {
                area_to_flicker: '/maintenance/north_east',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Flicker Lights SE"
            tooltip="Flickers some lightbulbs in that maintenance area for a short, random interval."
            onClick={() => {
              act('blackstone_flicker_light', {
                area_to_flicker: '/maintenance/south_east',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Flicker Lights NW"
            tooltip="Flickers some lightbulbs in that maintenance area for a short, random interval."
            onClick={() => {
              act('blackstone_flicker_light', {
                area_to_flicker: '/maintenance/north_west',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Flicker Lights SW"
            tooltip="Flickers some lightbulbs in that maintenance area for a short, random interval."
            onClick={() => {
              act('blackstone_flicker_light', {
                area_to_flicker: '/maintenance/south_west',
              });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            content="Spawn Ambush Sites"
            tooltip="Randomly spawn a bunch of ambush sites in the maintenance tunnels."
            onClick={() => {
              act('blackstone_spawn_ambush');
            }}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};
