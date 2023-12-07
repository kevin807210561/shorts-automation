#!/bin/bash

# Created by argbash-init v2.10.0
# ARG_OPTIONAL_SINGLE([topic-url],[],[eg. https://www.zhihu.com/question/613569488/answer/3138257334])
# ARG_OPTIONAL_SINGLE([content-video],[],[can be local path or url supported by yt-dlp])
# ARG_OPTIONAL_SINGLE([input-file],[],[for multiple topics, one topic in one line, sperate topic-url and content-video by space])
# ARG_HELP([Used for generate topic video from text.])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.10.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='h'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_topic_url=
_arg_content_video=
_arg_input_file=


print_help()
{
	printf '%s\n' "Used for generate topic video from text."
	printf 'Usage: %s [--topic-url <arg>] [--content-video <arg>] [--input-file <arg>] [-h|--help]\n' "$0"
	printf '\t%s\n' "--topic-url: eg. https://www.zhihu.com/question/613569488/answer/3138257334 (no default)"
	printf '\t%s\n' "--content-video: can be local path or url supported by yt-dlp (no default)"
	printf '\t%s\n' "--input-file: for multiple topics, one topic in one line, sperate topic-url and content-video by space (no default)"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			--topic-url)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_topic_url="$2"
				shift
				;;
			--topic-url=*)
				_arg_topic_url="${_key##--topic-url=}"
				;;
			--content-video)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_content_video="$2"
				shift
				;;
			--content-video=*)
				_arg_content_video="${_key##--content-video=}"
				;;
			--input-file)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_input_file="$2"
				shift
				;;
			--input-file=*)
				_arg_input_file="${_key##--input-file=}"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
				;;
		esac
		shift
	done
}

parse_commandline "$@"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash


function log {
    echo "$(date "+%Y-%m-%d %H:%M:%S") [$0] $1 $2" >&2
}

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

[[ -z "$_arg_topic_url" ]] || [[ -z "$_arg_content_video" ]] || {
    "${SCRIPT_DIR}/input_single.sh" "$_arg_topic_url" "$_arg_content_video" || {
        log ERROR "generate for $_arg_topic_url $_arg_content_video failed"
        exit 1
    }
}
[[ -z "$_arg_input_file" ]] || {
    "${SCRIPT_DIR}/input_multiple.sh" "$_arg_input_file" || {
        log ERROR "generate for $_arg_input_file failed"
        exit 1
    }
}


# ] <-- needed because of Argbash
