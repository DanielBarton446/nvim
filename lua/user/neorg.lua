require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Defaults
    ["core.concealer"] = {}, -- Pretty icons
    ["core.esupports.indent"] = {}, -- indent nicely
    ["core.dirman"] = { -- Workspace management
      config = {
        workspaces = {
          work = "~/notes/work/",
          rust = "~/notes/rust/",
          texas = "~/notes/texas/",
          vacation = "~/notes/vacation/",
          osn = "~/notes/osn/",
          personal_configs = "~/notes/personal_configs/"
        },
        -- index = "~/notes/index.norg"
      }
    }
  },
  ["core.integrations.telescope"] = {} -- telescope integrations
}
