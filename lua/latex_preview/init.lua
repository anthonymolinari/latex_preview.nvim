---@diagnostic disable: undefined-global
-- todo:
--
--  *configuration: 
--      1. pdf viewer choice via configuration
--
--  *use plenary and allow hide show for latexmk output
--  *allow use of pdftotext insted, writing output to a read only buffer on events 

local Job   = require('plenary.job')
local scan  = require('plenary.scandir')
local path  = require('plenary.path')
local popup = require('plenary.popup')

local preview_runner = {}
local pdf_viewer = {}
Selection_win_id = nil

local M = {}

M.Select = function()
    local width = 60
    local height = 10

    local win_config = {
        title = "Select Tex File",
        line = math.floor(((vim.o.lines - height) / 2) -1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        miheight = height,
    }
    local files = scan.scan_dir('.', { hidden = false, depth = 1})

    local Selection_win_id, win = popup.create(files, win_config)
    print('selection_win_id: ', selection_win_id)

    -- enable highlight

    return {
        win_id = selection_win_id   
    }
end

M.ToggleSelect = function()
    if Selection_win_id ~= nil and vim.api.nvim_win_is_valid(Selection_win_id) then
        vim.api.nvim_win_close(selection_win_id, true)
    else 
        M.Select()
    end
end

M.Preview = function()
    local cwd = vim.fn.getcwd()
    preview_runner = Job:new({
        command = '/usr/bin/latexmk',
        args = { '-pdf', '-pvc', "*.tex" },
        cwd = cwd,
        on_stdout = function()
            -- write stdout to a buffer
        end,
        on_stderr = function()
            -- write stderr to a buffer
        end,
        on_exit = function(j, return_val)
            print(return_val)
            print(j:result())
        end,
    })
    preview_runner:start()
end

M.StopPreview = function() 
    if preview_runner ~= nil then
        preview_runner:shutdown()
    end
end

-- todo : use editor from configuration 
M.OpenPreview = function()
    local cwd = vim.fn.getcwd()
    print(cwd)
    pdf_viewer = Job:new({
        command = '/usr/bin/zathura',
        args = { '*.pdf' },
        cwd = cwd,
        on_exit = function(j, return_val)
            print(return_val)
            print(j:result())
        end,
    })
    pdf_viewer:start()
end

M.ClosePreview = function()
    if pdf_viewer ~= nil then
        pdf_viewer:shutdown()
    end
end

return M
