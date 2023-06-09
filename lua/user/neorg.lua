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
          vacation = "~/notes/vacation/",
          osn = "~/notes/osn/"
        },
        -- index = "~/notes/index.norg"
      }
    }
  },
  ["core.integrations.telescope"] = {} -- telescope integrations
}
