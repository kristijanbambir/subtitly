# subtitly

Fix unsynchronized SRT subtitles

(c) 2012 Kristijan Bambir [www.kristijanbambir.from.hr]

Released under The MIT License.

## Description:

subtitly is a simple Ruby script that shifts subtitle timestamps with the desired offset in seconds.

## Homepage:

http://www.kristijanbambir.from.hr/subtitly/

## Source:

Hosted at GitHub; browse at:

https://github.com/kristijanbambir/subtitly

Or clone from:

    git://github.com/kristijanbambir/subtitly.git

## Usage:

1. Download and install Ruby for your operating system (http://www.ruby-lang.org/en/downloads/).

2. Download the script to a desired location.

3. Open up the command line (terminal, command prompt, ...) and run the script upon a SRT subtitle file with the following command:
   
        ruby subtitly.rb SUBTITLE_FILE OFFSET

    Example:

        ruby subtitly.rb subtitle.srt 5

    This command will increase all timestamps for five seconds. You can also specify negative offsets for time decrease, and rational numbers with the decimal point or comma.
