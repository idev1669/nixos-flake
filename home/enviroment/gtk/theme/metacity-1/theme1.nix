{ config, lib, pkgs, uservars, ... }:
{
  home.file.".themes/dynamic-color-theme/metacity-1/metacity-theme-1.xml".text = ''
<?xml version="1.0"?>
<metacity_theme>
  <info>
    <name>dynamic-color-theme</name>
    <author>id3v1669</author>
    <copyright>GPL</copyright>
    <date>2023</date>
    <description>dynamic-color-theme</description>
  </info>

  <!-- CONSTANTS -->
  <constant name="C_titlebar" value="#373737" />
  <constant name="C_titlebar_unfocused" value="#373737" />
  <constant name="C_border_focused" value="#373737" />
  <constant name="C_border_unfocused" value="#373737" />
  <constant name="C_title_focused" value="#f5f5f5" />
  <constant name="C_title_unfocused" value="#dedede" />

  <constant name="C_wm_button_background" value="#dedede" />
  <constant name="C_wm_button_foreground" value="#dedede" />
  <constant name="C_wm_button_unfocused" value="#888888" />

  <constant name="C_close_button" value="#f5685d" />
  <constant name="C_maximize_button" value="#a1ce6d" />
  <constant name="C_restore_button" value="#feee61" />
  <constant name="C_minimize_button" value="#feee61" />

  <!-- GEOMETRY -->

  <!-- Focused window -->
  <frame_geometry name="normal" title_scale="medium" rounded_top_left="2" rounded_top_right="2">
    <distance name="left_width" value="5" />
    <distance name="right_width" value="5" />
    <distance name="bottom_height" value="5" />
    <distance name="left_titlebar_edge" value="10" />
    <distance name="right_titlebar_edge" value="10" />
    <distance name="title_vertical_pad" value="6" />
    <aspect_ratio name="button" value="1.0" />
    <border name="title_border" left="10" right="10" top="10" bottom="10" />
    <border name="button_border" left="2" right="2" top="10" bottom="10" />
  </frame_geometry>

  <!-- Unfocused window -->
  <frame_geometry name="normal_unfocused" title_scale="medium" rounded_top_left="2" rounded_top_right="2" parent="normal">
    <distance name="left_width" value="5" />
    <distance name="right_width" value="5" />
    <distance name="bottom_height" value="5" />
    <distance name="left_titlebar_edge" value="12" />
    <distance name="right_titlebar_edge" value="12" />
    <distance name="title_vertical_pad" value="6" />
    <aspect_ratio name="button" value="1.0" />
    <border name="title_border" left="10" right="10" top="10" bottom="10" />
    <border name="button_border" left="2" right="2" top="10" bottom="10" />
  </frame_geometry>

  <!-- Maximized window -->
  <frame_geometry name="max" title_scale="medium" parent="normal" rounded_top_left="false" rounded_top_right="false">
    <distance name="left_width" value="0" />
    <distance name="right_width" value="0" />
    <distance name="bottom_height" value="0" />
    <distance name="title_vertical_pad" value="4" />
    <border name="title_border" left="4" right="4" top="4" bottom="4" />
    <border name="button_border" left="0" right="0" top="4" bottom="4" />
  </frame_geometry>

  <!-- Left tiled window -->
  <frame_geometry name="tiled_left" title_scale="medium" rounded_top_left="false" rounded_top_right="false" parent="max">
    <distance name="right_width" value="0" />
  </frame_geometry>

  <!-- Right tiled window -->
  <frame_geometry name="tiled_right" title_scale="medium" rounded_top_left="false" rounded_top_right="false" parent="max">
    <distance name="left_width" value="0" />
  </frame_geometry>

  <!-- Small window -->
  <frame_geometry name="small" title_scale="small" parent="normal" rounded_top_left="false" rounded_top_right="false">
    <distance name="title_vertical_pad" value="4" />
    <border name="title_border" left="4" right="4" top="0" bottom="0" />
    <border name="button_border" left="0" right="0" top="0" bottom="0" />
  </frame_geometry>

  <!-- Small unfocused window -->
  <frame_geometry name="small_unfocused" parent="small">
    <distance name="left_titlebar_edge" value="5" />
    <distance name="right_titlebar_edge" value="5" />
  </frame_geometry>

  <!-- No buttons -->
  <frame_geometry name="nobuttons" hide_buttons="true" parent="normal"></frame_geometry>

  <!-- Border -->
  <frame_geometry name="border" has_title="false" rounded_top_left="false" rounded_top_right="false" parent="normal">
    <distance name="left_width" value="1" />
    <distance name="right_width" value="1" />
    <distance name="bottom_height" value="1" />
    <distance name="title_vertical_pad" value="1" />
    <border name="title_border" left="10" right="10" top="0" bottom="0" />
    <border name="button_border" left="0" right="0" top="0" bottom="0" />
  </frame_geometry>

  <!-- Borderless -->
  <frame_geometry name="borderless" has_title="false" rounded_top_left="false" rounded_top_right="false" parent="normal">
    <distance name="left_width" value="0" />
    <distance name="right_width" value="0" />
    <distance name="bottom_height" value="0" />
    <distance name="title_vertical_pad" value="8" />
    <border name="title_border" left="0" right="0" top="0" bottom="0" />
    <border name="button_border" left="0" right="0" top="0" bottom="0" />
  </frame_geometry>

  <!-- Modal -->
  <frame_geometry name="modal" title_scale="small" hide_buttons="true" rounded_top_left="false" rounded_top_right="false" parent="small">
    <distance name="title_vertical_pad" value="5" />
  </frame_geometry>

  <frame_geometry name="attached" title_scale="medium" hide_buttons="true" rounded_top_left="false" rounded_top_right="false" parent="normal">
    <distance name="title_vertical_pad" value="8" />
    <distance name="bottom_height" value="1" />
    <distance name="left_width" value="1" />
    <distance name="right_width" value="1" />
  </frame_geometry>


  <!-- TITLES -->

  <!-- Title alignment -->
  <draw_ops name="title_focused">
    <title x="(0 `max` ((width - title_width) / 2)) + 2" y="(0 `max` ((height - title_height) / 2))" color="C_title_focused" />
  </draw_ops>

  <draw_ops name="title_unfocused">
    <title x="(0 `max` ((width - title_width) / 2)) + 2" y="(0 `max` ((height - title_height) / 2))" color="C_title_unfocused" />
  </draw_ops>

  <!-- WINDOW DECORATIONS -->
  <draw_ops name="entire_background_focused">
    <rectangle color="C_titlebar" x="0" y="0" width="width" height="height" filled="true" />
  </draw_ops>

  <draw_ops name="entire_background_unfocused">
    <include name="entire_background_focused" />
  </draw_ops>

  <draw_ops name="titlebar_fill_focused">
    <rectangle color="C_titlebar" x="4" y="0" width="width" height="height" filled="true" />
  </draw_ops>

  <draw_ops name="titlebar_fill_attached_focused">
    <include name="entire_background_focused" />
  </draw_ops>

  <draw_ops name="titlebar_fill_unfocused">
    <rectangle color="C_titlebar_unfocused" x="0" y="0" width="width" height="height" filled="true" />
  </draw_ops>

  <draw_ops name="titlebar_focused">
    <include name="titlebar_fill_focused" />
  </draw_ops>

  <draw_ops name="titlebar_attached_focused">
    <!-- titlebar for attached and modal dialogs -->
    <include name="titlebar_fill_attached_focused" />
  </draw_ops>

  <draw_ops name="rounded_titlebar_focused">
    <include name="titlebar_fill_focused" />
  </draw_ops>

  <draw_ops name="border_focused">
    <rectangle color="C_border_focused" x="0" y="0" width="width-1" height="height-1" filled="false" />
  </draw_ops>

  <draw_ops name="border_unfocused">
    <rectangle color="C_border_unfocused" x="0" y="0" width="width-1" height="height-1" filled="false" />
  </draw_ops>

  <draw_ops name="rounded_border_focused">
    <line color="C_border_focused" x1="2" y1="0" x2="width-3" y2="0" />
    <line color="C_border_focused" x1="0" y1="height-1" x2="width-1" y2="height-1" />
    <line color="C_border_focused" x1="0" y1="2" x2="0" y2="height-2" />
    <line color="C_border_focused" x1="width-1" y1="2" x2="width-1" y2="height-2" />
    <arc color="C_border_focused" x="0" y="0" width="3" height="3" start_angle="270" extent_angle="90" />
    <arc color="C_border_focused" x="width-3" y="0" width="2" height="3" start_angle="0" extent_angle="90" />
    <!-- double arcs for darker borders -->
    <arc color="C_border_focused" x="0" y="0" width="3" height="3" start_angle="270" extent_angle="90" />
    <arc color="C_border_focused" x="width-3" y="0" width="2" height="3" start_angle="0" extent_angle="90" />
  </draw_ops>

  <draw_ops name="rounded_border_unfocused">
    <line color="C_border_unfocused" x1="2" y1="0" x2="width-3" y2="0" />
    <line color="C_border_unfocused" x1="0" y1="height-1" x2="width-1" y2="height-1" />
    <line color="C_border_unfocused" x1="0" y1="2" x2="0" y2="height-2" />
    <line color="C_border_unfocused" x1="width-1" y1="2" x2="width-1" y2="height-2" />
    <arc color="C_border_unfocused" x="0" y="0" width="3" height="3" start_angle="270" extent_angle="90" />
    <arc color="C_border_unfocused" x="width-3" y="0" width="2" height="3" start_angle="0" extent_angle="90" />
    <!-- double arcs for darker borders -->
    <arc color="C_border_unfocused" x="0" y="0" width="3" height="3" start_angle="270" extent_angle="90" />
    <arc color="C_border_unfocused" x="width-3" y="0" width="2" height="3" start_angle="0" extent_angle="90" />
  </draw_ops>

  <draw_ops name="border_right_focused">
    <line x1="width-1" y1="0" x2="width-1" y2="height" color="C_border_focused" />
  </draw_ops>

  <draw_ops name="border_right_unfocused">
    <line x1="width-1" y1="0" x2="width-1" y2="height" color="C_border_unfocused" />
  </draw_ops>

  <draw_ops name="border_left_focused">
    <line x1="0" y1="0" x2="0" y2="height" color="C_border_focused" />
  </draw_ops>

  <draw_ops name="border_left_unfocused">
    <line x1="0" y1="0" x2="0" y2="height" color="C_border_unfocused" />
  </draw_ops>

  <!-- ::: BUTTON ICONS ::: -->
  <!-- note: negative values in x or y causes gnome-shell to crash -->
  <!-- close icon -->
  <draw_ops name="close_focused">
    <image filename="titlebuttons/titlebutton-close.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="close_focused_prelight">
    <image filename="titlebuttons/titlebutton-close-hover.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="close_focused_pressed">
    <image filename="titlebuttons/titlebutton-close-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="close_unfocused">
    <image filename="titlebuttons/titlebutton-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="close_unfocused_prelight">
    <image filename="titlebuttons/titlebutton-close-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="close_unfocused_pressed">
    <image filename="titlebuttons/titlebutton-close-backdrop-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <!-- maximize icon -->
  <draw_ops name="maximize_focused">
    <image filename="titlebuttons/titlebutton-maximize.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="maximize_focused_prelight">
    <image filename="titlebuttons/titlebutton-maximize-hover.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="maximize_focused_pressed">
    <image filename="titlebuttons/titlebutton-maximize-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="maximize_unfocused">
    <image filename="titlebuttons/titlebutton-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="maximize_unfocused_prelight">
    <image filename="titlebuttons/titlebutton-maximize-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="maximize_unfocused_pressed">
    <image filename="titlebuttons/titlebutton-maximize-backdrop-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <!-- unmaximize icon -->
  <draw_ops name="unmaximize_focused">
    <image filename="titlebuttons/titlebutton-maximize.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unmaximize_focused_prelight">
    <image filename="titlebuttons/titlebutton-unmaximize-hover.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unmaximize_focused_pressed">
    <image filename="titlebuttons/titlebutton-unmaximize-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unmaximize_unfocused">
    <image filename="titlebuttons/titlebutton-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unmaximize_unfocused_prelight">
    <image filename="titlebuttons/titlebutton-unmaximize-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unmaximize_unfocused_pressed">
    <image filename="titlebuttons/titlebutton-unmaximize-backdrop-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <!-- minimize icon -->
  <draw_ops name="minimize_focused">
    <image filename="titlebuttons/titlebutton-minimize.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="minimize_focused_prelight">
    <image filename="titlebuttons/titlebutton-minimize-hover.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="minimize_focused_pressed">
    <image filename="titlebuttons/titlebutton-minimize-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="minimize_unfocused">
    <image filename="titlebuttons/titlebutton-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="minimize_unfocused_prelight">
    <image filename="titlebuttons/titlebutton-minimize-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="minimize_unfocused_pressed">
    <image filename="titlebuttons/titlebutton-minimize-backdrop-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <!-- Menu icon -->
  <draw_ops name="menu_focused">
    <image filename="titlebuttons/titlebutton-menu.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>
  <draw_ops name="menu_focused_prelight">
    <image filename="titlebuttons/titlebutton-menu-hover.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>
  <draw_ops name="menu_focused_pressed">
    <image filename="titlebuttons/titlebutton-menu-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>
  <draw_ops name="menu_unfocused">
    <image filename="titlebuttons/titlebutton-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>
  <draw_ops name="menu_unfocused_prelight">
    <image filename="titlebuttons/titlebutton-menu-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>
  <draw_ops name="menu_unfocused_pressed">
    <image filename="titlebuttons/titlebutton-menu-backdrop-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <!-- shade icon -->
  <draw_ops name="shade_focused">
    <image filename="titlebuttons/titlebutton-shade.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="shade_focused_prelight">
    <image filename="titlebuttons/titlebutton-shade-hover.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="shade_focused_pressed">
    <image filename="titlebuttons/titlebutton-shade-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="shade_unfocused">
    <image filename="titlebuttons/titlebutton-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="shade_unfocused_prelight">
    <image filename="titlebuttons/titlebutton-shade-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="shade_unfocused_pressed">
    <image filename="titlebuttons/titlebutton-shade-backdrop-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <!-- unshade icon -->
  <draw_ops name="unshade_focused">
    <image filename="titlebuttons/titlebutton-unshade.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unshade_focused_prelight">
    <image filename="titlebuttons/titlebutton-unshade-hover.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unshade_focused_pressed">
    <image filename="titlebuttons/titlebutton-unshade-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unshade_unfocused">
    <image filename="titlebuttons/titlebutton-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unshade_unfocused_prelight">
    <image filename="titlebuttons/titlebutton-unshade-backdrop.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>

  <draw_ops name="unshade_unfocused_pressed">
    <image filename="titlebuttons/titlebutton-unshade-backdrop-active.svg" x="0" y="1" width="object_width" height="object_height" />
  </draw_ops>


  <!-- FRAME STYLES -->
  <frame_style name="normal_focused" geometry="normal">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="titlebar" draw_ops="rounded_titlebar_focused" />
    <piece position="title" draw_ops="title_focused" />
    <piece position="overlay" draw_ops="rounded_border_focused" />
    <button function="close" state="normal" draw_ops="close_focused" />
    <button function="close" state="prelight" draw_ops="close_focused_prelight" />
    <button function="close" state="pressed" draw_ops="close_focused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_focused" />
    <button function="maximize" state="prelight" draw_ops="maximize_focused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_focused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_focused" />
    <button function="minimize" state="prelight" draw_ops="minimize_focused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_focused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_focused" />
    <button function="menu" state="prelight" draw_ops="menu_focused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_focused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_focused" />
    <button function="shade" state="prelight" draw_ops="shade_focused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_focused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_focused" />
    <button function="unshade" state="prelight" draw_ops="unshade_focused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_focused_pressed" />

    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="normal_unfocused" geometry="normal_unfocused">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="titlebar" draw_ops="titlebar_fill_unfocused" />
    <piece position="title" draw_ops="title_unfocused" />
    <piece position="overlay" draw_ops="rounded_border_unfocused" />
    <button function="close" state="normal" draw_ops="close_unfocused" />
    <button function="close" state="prelight" draw_ops="close_unfocused_prelight" />
    <button function="close" state="pressed" draw_ops="close_unfocused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_unfocused" />
    <button function="maximize" state="prelight" draw_ops="maximize_unfocused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_unfocused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_unfocused" />
    <button function="minimize" state="prelight" draw_ops="minimize_unfocused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_unfocused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_unfocused" />
    <button function="menu" state="prelight" draw_ops="menu_unfocused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_unfocused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_unfocused" />
    <button function="shade" state="prelight" draw_ops="shade_unfocused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_unfocused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_unfocused" />
    <button function="unshade" state="prelight" draw_ops="unshade_unfocused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_unfocused_pressed" />
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="normal_max_focused" geometry="max">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="titlebar" draw_ops="titlebar_fill_focused" />
    <piece position="title" draw_ops="title_focused" />
    <button function="close" state="normal" draw_ops="close_focused" />
    <button function="close" state="prelight" draw_ops="close_focused_prelight" />
    <button function="close" state="pressed" draw_ops="close_focused_pressed" />
    <button function="maximize" state="normal" draw_ops="unmaximize_focused" />
    <button function="maximize" state="prelight" draw_ops="unmaximize_focused_prelight" />
    <button function="maximize" state="pressed" draw_ops="unmaximize_focused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_focused" />
    <button function="minimize" state="prelight" draw_ops="minimize_focused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_focused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_focused" />
    <button function="menu" state="prelight" draw_ops="menu_focused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_focused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_focused" />
    <button function="shade" state="prelight" draw_ops="shade_focused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_focused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_focused" />
    <button function="unshade" state="prelight" draw_ops="unshade_focused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_focused_pressed" />

    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="normal_max_unfocused" geometry="max">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="titlebar" draw_ops="titlebar_fill_unfocused" />
    <piece position="title" draw_ops="title_unfocused" />
    <button function="close" state="normal" draw_ops="close_unfocused" />
    <button function="close" state="prelight" draw_ops="close_unfocused_prelight" />
    <button function="close" state="pressed" draw_ops="close_unfocused_pressed" />
    <button function="maximize" state="normal" draw_ops="unmaximize_unfocused" />
    <button function="maximize" state="prelight" draw_ops="unmaximize_unfocused_prelight" />
    <button function="maximize" state="pressed" draw_ops="unmaximize_unfocused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_unfocused" />
    <button function="minimize" state="prelight" draw_ops="minimize_unfocused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_unfocused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_unfocused" />
    <button function="menu" state="prelight" draw_ops="menu_unfocused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_unfocused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_unfocused" />
    <button function="shade" state="prelight" draw_ops="shade_unfocused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_unfocused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_unfocused" />
    <button function="unshade" state="prelight" draw_ops="unshade_unfocused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_unfocused_pressed" />
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="normal_max_shaded_focused" geometry="max">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="titlebar" draw_ops="titlebar_fill_focused" />
    <piece position="title" draw_ops="title_focused" />
    <piece position="overlay">
      <draw_ops>
        <line x1="0" y1="height-1" x2="width" y2="height-1" color="C_border_focused" />
      </draw_ops>
    </piece>
    <button function="close" state="normal" draw_ops="close_focused" />
    <button function="close" state="prelight" draw_ops="close_focused_prelight" />
    <button function="close" state="pressed" draw_ops="close_focused_pressed" />
    <button function="maximize" state="normal" draw_ops="unmaximize_focused" />
    <button function="maximize" state="prelight" draw_ops="unmaximize_focused_prelight" />
    <button function="maximize" state="pressed" draw_ops="unmaximize_focused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_focused" />
    <button function="minimize" state="prelight" draw_ops="minimize_focused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_focused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_focused" />
    <button function="menu" state="prelight" draw_ops="menu_focused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_focused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_focused" />
    <button function="shade" state="prelight" draw_ops="shade_focused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_focused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_focused" />
    <button function="unshade" state="prelight" draw_ops="unshade_focused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_focused_pressed" />

    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="normal_max_shaded_unfocused" geometry="max">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="titlebar" draw_ops="titlebar_fill_unfocused" />
    <piece position="title" draw_ops="title_unfocused" />
    <piece position="overlay">
      <draw_ops>
        <line x1="0" y1="height-1" x2="width" y2="height-1" color="C_border_unfocused" />
      </draw_ops>
    </piece>
    <button function="close" state="normal" draw_ops="close_unfocused" />
    <button function="close" state="prelight" draw_ops="close_unfocused_prelight" />
    <button function="close" state="pressed" draw_ops="close_unfocused_pressed" />
    <button function="maximize" state="normal" draw_ops="unmaximize_unfocused" />
    <button function="maximize" state="prelight" draw_ops="unmaximize_unfocused_prelight" />
    <button function="maximize" state="pressed" draw_ops="unmaximize_unfocused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_unfocused" />
    <button function="minimize" state="prelight" draw_ops="minimize_unfocused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_unfocused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_unfocused" />
    <button function="menu" state="prelight" draw_ops="menu_unfocused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_unfocused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_unfocused" />
    <button function="shade" state="prelight" draw_ops="shade_unfocused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_unfocused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_unfocused" />
    <button function="unshade" state="prelight" draw_ops="unshade_unfocused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_unfocused_pressed" />
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="dialog_focused" geometry="nobuttons">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="titlebar" draw_ops="rounded_titlebar_focused" />
    <piece position="title" draw_ops="title_focused" />
    <piece position="overlay" draw_ops="rounded_border_focused" />
    <button function="close" state="normal" draw_ops="close_focused" />
    <button function="close" state="prelight" draw_ops="close_focused_prelight" />
    <button function="close" state="pressed" draw_ops="close_focused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_focused" />
    <button function="maximize" state="prelight" draw_ops="maximize_focused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_focused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_focused" />
    <button function="minimize" state="prelight" draw_ops="minimize_focused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_focused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_focused" />
    <button function="menu" state="prelight" draw_ops="menu_focused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_focused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_focused" />
    <button function="shade" state="prelight" draw_ops="shade_focused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_focused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_focused" />
    <button function="unshade" state="prelight" draw_ops="unshade_focused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_focused_pressed" />

    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="dialog_unfocused" geometry="nobuttons">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="titlebar" draw_ops="titlebar_fill_unfocused" />
    <piece position="title" draw_ops="title_unfocused" />
    <piece position="overlay" draw_ops="rounded_border_unfocused" />
    <button function="close" state="normal" draw_ops="close_unfocused" />
    <button function="close" state="prelight" draw_ops="close_unfocused_prelight" />
    <button function="close" state="pressed" draw_ops="close_unfocused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_unfocused" />
    <button function="maximize" state="prelight" draw_ops="maximize_unfocused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_unfocused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_unfocused" />
    <button function="minimize" state="prelight" draw_ops="minimize_unfocused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_unfocused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_unfocused" />
    <button function="menu" state="prelight" draw_ops="menu_unfocused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_unfocused_pressed" />
    <button function="shade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="modal_dialog_focused" geometry="modal">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="titlebar" draw_ops="titlebar_attached_focused" />
    <piece position="title" draw_ops="title_focused" />
    <piece position="overlay" draw_ops="border_focused" />
    <button function="close" state="normal" draw_ops="close_focused" />
    <button function="close" state="prelight" draw_ops="close_focused_prelight" />
    <button function="close" state="pressed" draw_ops="close_focused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_focused" />
    <button function="maximize" state="prelight" draw_ops="maximize_focused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_focused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_focused" />
    <button function="minimize" state="prelight" draw_ops="minimize_focused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_focused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_focused" />
    <button function="menu" state="prelight" draw_ops="menu_focused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_focused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_focused" />
    <button function="shade" state="prelight" draw_ops="shade_focused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_focused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_focused" />
    <button function="unshade" state="prelight" draw_ops="unshade_focused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_focused_pressed" />

    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="modal_dialog_unfocused" geometry="modal">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="titlebar" draw_ops="titlebar_fill_unfocused" />
    <piece position="title" draw_ops="title_unfocused" />
    <piece position="overlay" draw_ops="border_unfocused" />
    <button function="close" state="normal" draw_ops="close_unfocused" />
    <button function="close" state="prelight" draw_ops="close_unfocused_prelight" />
    <button function="close" state="pressed" draw_ops="close_unfocused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_unfocused" />
    <button function="maximize" state="prelight" draw_ops="maximize_unfocused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_unfocused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_unfocused" />
    <button function="minimize" state="prelight" draw_ops="minimize_unfocused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_unfocused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_unfocused" />
    <button function="menu" state="prelight" draw_ops="menu_unfocused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_unfocused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_unfocused" />
    <button function="shade" state="prelight" draw_ops="shade_unfocused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_unfocused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_unfocused" />
    <button function="unshade" state="prelight" draw_ops="unshade_unfocused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_unfocused_pressed" />
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="utility_focused" geometry="small">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="titlebar" draw_ops="titlebar_focused" />
    <piece position="title" draw_ops="title_focused" />
    <piece position="overlay" draw_ops="border_focused" />
    <button function="close" state="normal" draw_ops="close_focused" />
    <button function="close" state="prelight" draw_ops="close_focused_prelight" />
    <button function="close" state="pressed" draw_ops="close_focused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_focused" />
    <button function="maximize" state="prelight" draw_ops="maximize_focused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_focused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_focused" />
    <button function="minimize" state="prelight" draw_ops="minimize_focused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_focused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_focused" />
    <button function="menu" state="prelight" draw_ops="menu_focused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_focused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_focused" />
    <button function="shade" state="prelight" draw_ops="shade_focused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_focused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_focused" />
    <button function="unshade" state="prelight" draw_ops="unshade_focused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_focused_pressed" />

    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="utility_unfocused" geometry="small_unfocused">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="titlebar" draw_ops="titlebar_fill_unfocused" />
    <piece position="title" draw_ops="title_unfocused" />
    <piece position="overlay" draw_ops="border_unfocused" />
    <button function="close" state="normal" draw_ops="close_unfocused" />
    <button function="close" state="prelight" draw_ops="close_unfocused_prelight" />
    <button function="close" state="pressed" draw_ops="close_unfocused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_unfocused" />
    <button function="maximize" state="prelight" draw_ops="maximize_unfocused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_unfocused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_unfocused" />
    <button function="minimize" state="prelight" draw_ops="minimize_unfocused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_unfocused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_unfocused" />
    <button function="menu" state="prelight" draw_ops="menu_unfocused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_unfocused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_unfocused" />
    <button function="shade" state="prelight" draw_ops="shade_unfocused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_unfocused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_unfocused" />
    <button function="unshade" state="prelight" draw_ops="unshade_unfocused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_unfocused_pressed" />
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="border_focused" geometry="border">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="overlay" draw_ops="border_focused" />
    <button function="close" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="close" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="border_unfocused" geometry="border">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="overlay" draw_ops="border_unfocused" />
    <button function="close" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="close" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="borderless" geometry="borderless">
    <button function="close" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="close" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="attached_focused" geometry="attached">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="titlebar" draw_ops="titlebar_attached_focused" />
    <piece position="title" draw_ops="title_focused" />
    <piece position="overlay" draw_ops="border_focused" />
    <button function="close" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="close" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="attached_unfocused" geometry="attached">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="titlebar" draw_ops="titlebar_attached_focused" />
    <piece position="title" draw_ops="title_unfocused" />
    <piece position="overlay" draw_ops="border_unfocused" />
    <button function="close" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="close" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="tiled_left_focused" geometry="tiled_left">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="titlebar" draw_ops="titlebar_fill_focused" />
    <piece position="title" draw_ops="title_focused" />
    <piece position="overlay" draw_ops="border_right_focused" />
    <button function="close" state="normal" draw_ops="close_focused" />
    <button function="close" state="prelight" draw_ops="close_focused_prelight" />
    <button function="close" state="pressed" draw_ops="close_focused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_focused" />
    <button function="maximize" state="prelight" draw_ops="maximize_focused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_focused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_focused" />
    <button function="minimize" state="prelight" draw_ops="minimize_focused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_focused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_focused" />
    <button function="menu" state="prelight" draw_ops="menu_focused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_focused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_focused" />
    <button function="shade" state="prelight" draw_ops="shade_focused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_focused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_focused" />
    <button function="unshade" state="prelight" draw_ops="unshade_focused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_focused_pressed" />

    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="tiled_left_unfocused" geometry="tiled_left">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="titlebar" draw_ops="titlebar_fill_unfocused" />
    <piece position="title" draw_ops="title_unfocused" />
    <piece position="overlay" draw_ops="border_right_unfocused" />
    <button function="close" state="normal" draw_ops="close_unfocused" />
    <button function="close" state="prelight" draw_ops="close_unfocused_prelight" />
    <button function="close" state="pressed" draw_ops="close_unfocused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_unfocused" />
    <button function="maximize" state="prelight" draw_ops="maximize_unfocused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_unfocused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_unfocused" />
    <button function="minimize" state="prelight" draw_ops="minimize_unfocused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_unfocused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_unfocused" />
    <button function="menu" state="prelight" draw_ops="menu_unfocused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_unfocused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_unfocused" />
    <button function="shade" state="prelight" draw_ops="shade_unfocused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_unfocused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_unfocused" />
    <button function="unshade" state="prelight" draw_ops="unshade_unfocused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_unfocused_pressed" />
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="tiled_right_focused" geometry="tiled_right">
    <piece position="entire_background" draw_ops="entire_background_focused" />
    <piece position="titlebar" draw_ops="titlebar_fill_focused" />
    <piece position="title" draw_ops="title_focused" />
    <piece position="overlay" draw_ops="border_left_focused" />
    <button function="close" state="normal" draw_ops="close_focused" />
    <button function="close" state="prelight" draw_ops="close_focused_prelight" />
    <button function="close" state="pressed" draw_ops="close_focused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_focused" />
    <button function="maximize" state="prelight" draw_ops="maximize_focused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_focused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_focused" />
    <button function="minimize" state="prelight" draw_ops="minimize_focused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_focused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_focused" />
    <button function="menu" state="prelight" draw_ops="menu_focused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_focused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_focused" />
    <button function="shade" state="prelight" draw_ops="shade_focused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_focused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_focused" />
    <button function="unshade" state="prelight" draw_ops="unshade_focused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_focused_pressed" />

    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <frame_style name="tiled_right_unfocused" geometry="tiled_right">
    <piece position="entire_background" draw_ops="entire_background_unfocused" />
    <piece position="titlebar" draw_ops="titlebar_fill_unfocused" />
    <piece position="title" draw_ops="title_unfocused" />
    <piece position="overlay" draw_ops="border_left_unfocused" />
    <button function="close" state="normal" draw_ops="close_unfocused" />
    <button function="close" state="prelight" draw_ops="close_unfocused_prelight" />
    <button function="close" state="pressed" draw_ops="close_unfocused_pressed" />
    <button function="maximize" state="normal" draw_ops="maximize_unfocused" />
    <button function="maximize" state="prelight" draw_ops="maximize_unfocused_prelight" />
    <button function="maximize" state="pressed" draw_ops="maximize_unfocused_pressed" />
    <button function="minimize" state="normal" draw_ops="minimize_unfocused" />
    <button function="minimize" state="prelight" draw_ops="minimize_unfocused_prelight" />
    <button function="minimize" state="pressed" draw_ops="minimize_unfocused_pressed" />
    <button function="menu" state="normal" draw_ops="menu_unfocused" />
    <button function="menu" state="prelight" draw_ops="menu_unfocused_prelight" />
    <button function="menu" state="pressed" draw_ops="menu_unfocused_pressed" />
    <button function="shade" state="normal" draw_ops="shade_unfocused" />
    <button function="shade" state="prelight" draw_ops="shade_unfocused_prelight" />
    <button function="shade" state="pressed" draw_ops="shade_unfocused_pressed" />
    <button function="unshade" state="normal" draw_ops="unshade_unfocused" />
    <button function="unshade" state="prelight" draw_ops="unshade_unfocused_prelight" />
    <button function="unshade" state="pressed" draw_ops="unshade_unfocused_pressed" />
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <!-- placeholder for unimplementated styles-->
  <frame_style name="blank" geometry="normal">
    <button function="close" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="close" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="maximize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="minimize" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="menu" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="shade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="prelight">
      <draw_ops></draw_ops>
    </button>
    <button function="unshade" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="above" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unabove" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="stick" state="pressed">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="normal">
      <draw_ops></draw_ops>
    </button>
    <button function="unstick" state="pressed">
      <draw_ops></draw_ops>
    </button>
  </frame_style>

  <!-- FRAME STYLE SETS -->
  <frame_style_set name="normal_style_set">
    <frame focus="yes" state="normal" resize="both" style="normal_focused" />
    <frame focus="no" state="normal" resize="both" style="normal_unfocused" />
    <frame focus="yes" state="maximized" style="normal_max_focused" />
    <frame focus="no" state="maximized" style="normal_max_unfocused" />
    <frame focus="yes" state="shaded" style="normal_focused" />
    <frame focus="no" state="shaded" style="normal_unfocused" />
    <frame focus="yes" state="maximized_and_shaded" style="normal_max_shaded_focused" />
    <frame focus="no" state="maximized_and_shaded" style="normal_max_shaded_unfocused" />
  </frame_style_set>

  <frame_style_set name="dialog_style_set">
    <frame focus="yes" state="normal" resize="both" style="dialog_focused" />
    <frame focus="no" state="normal" resize="both" style="dialog_unfocused" />
    <frame focus="yes" state="maximized" style="blank" />
    <frame focus="no" state="maximized" style="blank" />
    <frame focus="yes" state="shaded" style="dialog_focused" />
    <frame focus="no" state="shaded" style="dialog_unfocused" />
    <frame focus="yes" state="maximized_and_shaded" style="blank" />
    <frame focus="no" state="maximized_and_shaded" style="blank" />
  </frame_style_set>

  <frame_style_set name="modal_dialog_style_set">
    <frame focus="yes" state="normal" resize="both" style="modal_dialog_focused" />
    <frame focus="no" state="normal" resize="both" style="modal_dialog_unfocused" />
    <frame focus="yes" state="maximized" style="blank" />
    <frame focus="no" state="maximized" style="blank" />
    <frame focus="yes" state="shaded" style="modal_dialog_focused" />
    <frame focus="no" state="shaded" style="modal_dialog_unfocused" />
    <frame focus="yes" state="maximized_and_shaded" style="blank" />
    <frame focus="no" state="maximized_and_shaded" style="blank" />
  </frame_style_set>

  <frame_style_set name="utility_style_set">
    <frame focus="yes" state="normal" resize="both" style="utility_focused" />
    <frame focus="no" state="normal" resize="both" style="utility_unfocused" />
    <frame focus="yes" state="maximized" style="blank" />
    <frame focus="no" state="maximized" style="blank" />
    <frame focus="yes" state="shaded" style="utility_focused" />
    <frame focus="no" state="shaded" style="utility_unfocused" />
    <frame focus="yes" state="maximized_and_shaded" style="blank" />
    <frame focus="no" state="maximized_and_shaded" style="blank" />
  </frame_style_set>

  <frame_style_set name="border_style_set">
    <frame focus="yes" state="normal" resize="both" style="border_focused" />
    <frame focus="no" state="normal" resize="both" style="border_unfocused" />
    <frame focus="yes" state="maximized" style="borderless" />
    <frame focus="no" state="maximized" style="borderless" />
    <frame focus="yes" state="shaded" style="blank" />
    <frame focus="no" state="shaded" style="blank" />
    <frame focus="yes" state="maximized_and_shaded" style="blank" />
    <frame focus="no" state="maximized_and_shaded" style="blank" />
  </frame_style_set>

  <!-- WINDOWS -->
  <window type="normal" style_set="normal_style_set" />
  <window type="dialog" style_set="dialog_style_set" />
  <window type="modal_dialog" style_set="modal_dialog_style_set" />
  <window type="menu" style_set="utility_style_set" />
  <window type="utility" style_set="utility_style_set" />
  <window type="border" style_set="border_style_set" />

</metacity_theme>

  '';
}