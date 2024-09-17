return {
  "monaqa/dial.nvim", -- Ensure dial.nvim is loaded
  config = function()
    -- Require the augend module from dial.nvim
    local augend = require("dial.augend")

    local logical_alias = augend.constant.new({
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    })

    local ordinal_numbers = augend.constant.new({
      -- elements through which we cycle. When we increment, we go down
      -- On decrement we go up
      elements = {
        "first",
        "second",
        "third",
        "fourth",
        "fifth",
        "sixth",
        "seventh",
        "eighth",
        "ninth",
        "tenth",
      },
      -- if true, it only matches strings with word boundary. firstDate wouldn't work for example
      word = false,
      -- do we cycle back and forth (tenth to first on increment, first to tenth on decrement).
      -- Otherwise nothing will happen when there are no further values
      cyclic = true,
    })

    local weekdays = augend.constant.new({
      elements = {
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday",
      },
      word = true,
      cyclic = true,
    })

    local months = augend.constant.new({
      elements = {
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      },
      word = true,
      cyclic = true,
    })

    -- Register custom augends to support true/false toggling
    require("dial.config").augends:register_group({
      default = {
        augend.constant.new({
          elements = { "true", "false" }, -- Toggle between true and false
          word = true, -- Treat them as whole words
          cyclic = true, -- Cyclic toggling (loops around)
        }),
        augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
        logical_alias,
        ordinal_numbers,
        weekdays,
        months,
        augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        -- You can also add more constants or configurations here if needed.
        -- augend.integer.alias.decimal,
        -- augend.integer.alias.hex,
      },
    })

    -- Set up key mappings for dial.nvim (Ctrl+a for increment, Ctrl+x for decrement)
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Normal mode mappings
    map("n", "<C-a>", "<Plug>(dial-increment)", opts)
    map("n", "<C-x>", "<Plug>(dial-decrement)", opts)

    -- Visual mode mappings (if you want to use visual selections)
    map("v", "<C-a>", "<Plug>(dial-increment)", opts)
    map("v", "<C-x>", "<Plug>(dial-decrement)", opts)
  end,
}
