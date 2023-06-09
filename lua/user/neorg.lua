require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Defaults
    ["core.norg.concealer"] = {}, -- Pretty icons
    ["core.norg.esupports.indent"] = {}, -- indent nicely
    ["core.norg.dirman"] = { -- Workspace management
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
