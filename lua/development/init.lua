local status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
    print("AutoPairs failed to load!")
    return
end
autopairs.setup {}
