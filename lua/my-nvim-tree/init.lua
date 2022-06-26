local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    print("NVIM Tree failed to load")
    return
end
nvim_tree.setup {}
