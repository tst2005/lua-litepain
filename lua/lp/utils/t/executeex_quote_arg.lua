--- Generally useful routines.
-- See  @{01-introduction.md.Generally_useful_functions|the Guide}.
--
-- Dependencies: `lp.compat`, all exported fields and functions from
-- `lp.compat` are also available in this module.
--
-- @module lp.utils.t.executeex_quote_arg


--- OS functions
-- @section OS-functions

--- execute a shell command and return the output.
-- This function redirects the output to tempfiles and returns the content of those files.
-- @param cmd a shell command
-- @param bin boolean, if true, read output as binary file
-- @return true if successful
-- @return actual return code
-- @return stdout output (string)
-- @return errout output (string)
function utils.executeex(cmd, bin)
    local outfile = os.tmpname()
    local errfile = os.tmpname()

    if is_windows and not outfile:find(':') then
        outfile = os.getenv('TEMP')..outfile
        errfile = os.getenv('TEMP')..errfile
    end
    cmd = cmd .. " > " .. utils.quote_arg(outfile) .. " 2> " .. utils.quote_arg(errfile)

    local success, retcode = utils.execute(cmd)
    local outcontent = utils.readfile(outfile, bin)
    local errcontent = utils.readfile(errfile, bin)
    os.remove(outfile)
    os.remove(errfile)
    return success, retcode, (outcontent or ""), (errcontent or "")
end

--- Quote and escape an argument of a command.
-- Quotes a single (or list of) argument(s) of a command to be passed
-- to `os.execute`, `lp.utils.execute` or `lp.utils.executeex`.
-- @param argument (string or table/list) the argument to quote. If a list then
-- all arguments in the list will be returned as a single string quoted.
-- @return quoted and escaped argument.
-- @usage
-- local options = utils.quote_arg {
--     "-lluacov",
--     "-e",
--     "utils = print(require('lp.utils')._VERSION",
-- }
-- -- returns: -lluacov -e 'utils = print(require('\''lp.utils'\'')._VERSION'
function utils.quote_arg(argument)
    if type(argument) == "table" then
        -- encode an entire table
        local r = {}
        for i, arg in ipairs(argument) do
            r[i] = utils.quote_arg(arg)
        end

        return table.concat(r, " ")
    end
    -- only a single argument
    if is_windows then
        if argument == "" or argument:find('[ \f\t\v]') then
            -- Need to quote the argument.
            -- Quotes need to be escaped with backslashes;
            -- additionally, backslashes before a quote, escaped or not,
            -- need to be doubled.
            -- See documentation for CommandLineToArgvW Windows function.
            argument = '"' .. argument:gsub([[(\*)"]], [[%1%1\"]]):gsub([[\+$]], "%0%0") .. '"'
        end

        -- os.execute() uses system() C function, which on Windows passes command
        -- to cmd.exe. Escape its special characters.
        return (argument:gsub('["^<>!|&%%]', "^%0"))
    else
        if argument == "" or argument:find('[^a-zA-Z0-9_@%+=:,./-]') then
            -- To quote arguments on posix-like systems use single quotes.
            -- To represent an embedded single quote close quoted string ('),
            -- add escaped quote (\'), open quoted string again (').
            argument = "'" .. argument:gsub("'", [['\'']]) .. "'"
        end

        return argument
    end
end

return utils
