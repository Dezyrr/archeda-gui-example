-- [ Archeda.xyz Lua Executor | GUI Example ] --
-- [ Written By Desire ] --
-- [ 28/01/24 ] --

local variables = {
    checkbox = false, 
    slider_int = 0, 
    slider_float = 0,
    key_bind = 0x2E,
    combo_int = 0,
}

local menu = {
    title = "DESIRE.LUA",
    padding = vec2.new(5, 5),

    tab = 1,
    tab_names = {
        "Aimbot",
        "ESP",
        "Misc",
        "Configs"
    },

    colors = {
        accent = color.new(208, 180, 255, 255),
        text = color.new(160, 160, 160, 255),
        window_background = color.new(25, 25, 25, 255),
        child_background = color.new(12, 12, 12, 255),
        widget = color.new(0, 0, 0, 100),
        widget_hovered = color.new(0, 0, 0, 50),
        selectable = color.new(0, 0, 0, 0),
        selectable_hovered = color.new(0, 0, 0, 0),
        popup_background = color.new(25, 25, 25, 255),
    }
}

func.add(function()
    if not key.is_toggled(variables.key_bind) then return end

    -- set all wanted colors
    gui.push_color(color_var.TEXT, menu.colors.text)
    gui.push_color(color_var.CHECKMARK, menu.colors.accent)
    gui.push_color(color_var.SLIDER_GRAB_ACTIVE, menu.colors.accent)
    gui.push_color(color_var.SLIDER_GRAB, menu.colors.accent)
    gui.push_color(color_var.FRAME_BACKGROUND, menu.colors.widget)
    gui.push_color(color_var.FRAME_BACKGROUND_HOVERED, menu.colors.widget_hovered)
    gui.push_color(color_var.FRAME_BACKGROUND_ACTIVE, menu.colors.widget)
    gui.push_color(color_var.BUTTON, menu.colors.widget)
    gui.push_color(color_var.BUTTON_HOVERED, menu.colors.widget_hovered)
    gui.push_color(color_var.BUTTON_ACTIVE, menu.colors.widget)
    gui.push_color(color_var.CHILD_BACKGROUND, menu.colors.child_background)
    gui.push_color(color_var.WINDOW_BACKGROUND, menu.colors.window_background)
    gui.push_color(color_var.HEADER, menu.colors.selectable)
    gui.push_color(color_var.HEADER_HOVERED, menu.colors.selectable_hovered)
    gui.push_color(color_var.HEADER_ACTIVE, menu.colors.selectable)
    gui.push_color(color_var.POPUP_BACKGROUND, menu.colors.popup_background)

    -- set all wanted style variables
    gui.push_style(style_var.WINDOW_BORDER_SIZE, 0.1)
    gui.push_style(style_var.CHILD_BORDER_SIZE, 0.1)
    gui.push_style_vec(style_var.WINDOW_PADDING, menu.padding)

    -- if you set the window size to -1 it will auto scale
    gui.set_window_size(vec2.new(-1, -1))
        -- begin_window(string title, flags)
        gui.begin_window("title", window_flags.NO_DECORATION)  -- window_flags.NO_DECORATION = remove top bar, remove resize, remove scrollbar
            gui.text(menu.title, text_pos.CENTER, color.new(160, 160, 160, 255))   
            -- set_cursor_pos = sets the position of any widget that is on the next line
            gui.set_cursor_pos(vec2.new(menu.padding.x, gui.get_text_size(menu.title).y + menu.padding.y * 2))
            -- create a group so we can have all of our widgets together and pushed by set_cursor_pos (so we dont have to set_cursor_pos individually for every single widget)
            gui.begin_group()
            
                -- loop through our tab names
                for i = 1, #menu.tab_names do
                    -- create a button for each tab name
                    if gui.button(menu.tab_names[i], vec2.new(100, 23)) then 
                        -- when this button is pressed the tab integer will change
                        menu.tab = i
                    end
                    -- force sameline so that all the buttons are aligned along the x axis
                    gui.same_line()
                end

            gui.end_group()

            -- begin our child window
            -- begin_child(string title, vec2 pos, bool border, flags)
            gui.begin_child("child", vec2.new(-1 + 1, 260), true, window_flags.NONE) -- window_flags.NONE = no flags are being used
            gui.set_cursor_pos(vec2.new(5, 5))
            gui.begin_group()

                -- change what widgets are being created based on which tab we are on
                if menu.tab == 1 then
                    -- combo(string name, int default_value, string_item_names_separated_by_\0)
                    variables.combo_int = gui.combo("Combo", variables.combo_int, "Item 1\0Item 2\0Item 3\0")
                else if menu.tab == 2 then

                else if menu.tab == 3 then
                    -- keybind (string name, int default_value)
                    variables.key_bind = gui.key_bind("Open UI", variables.key_bind)

                    -- keybind (string name, color default_value)
                    menu.colors.accent = gui.color_picker("Accent", menu.colors.accent)
                else if menu.tab == 4 then
                    
                end
                end
                end
                end

            gui.end_group()
            gui.end_child()
        gui.end_window()
    gui.pop_style(3) -- 3 = how many times push_style & push_style_vec are called
    gui.pop_color(13) -- 13 = how many times push_color is called
end)
