local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
    print 'toggleterm not loaded'
    return
end

local configs = {
    direction = 'float'
}

toggleterm.setup(configs)
