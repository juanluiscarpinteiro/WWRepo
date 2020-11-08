require 'pathname'
require 'roo'
require 'json'


def doesFileExist(dir)
    $inputedFile = dir
    localDir = Dir.pwd
    # puts localDir
    $pn = Pathname.new(localDir+dir.to_s)
    # puts $pn
    return $pn.exist?()
end
# method that calls with inputted file name to check if it exists
doesItExist =  doesFileExist("/dictionary.xlsx")
if(doesItExist == false)
    # if the file does not exist, It will prompt message  
    puts "File does not exist"
else
    # else if continues to process data to siplay in format requested
    # Use a gem to process the data from excel and parse it 
    xlsx = Roo::Spreadsheet.open('.'+$inputedFile)
    xlsx.default_sheet = 'dictionary'
    dictionaryStartData =xlsx.sheet('dictionary').first_row()
    dictionaryEndData =xlsx.sheet('dictionary').last_row()
    firstcolumnData = []
    secondcolumnData = []
    sheet = xlsx.sheet('dictionary')

    # brake the data into columns and save them into a variable
    @firstcolumnData= sheet.column(1)
    @secondColumnData = sheet.column(2)
    # debug
    # puts firstcolumnData
    # puts "----------------------"
    # puts secondColumnData
    @firstcolumnData.zip(@secondColumnData).each do |first, second|
        # Displaying the Word 
        puts first
        secondArray = second.split(',').map(&:strip)
        # Displaying the meanings after being processed 
        puts secondArray
        # adding a line to show better while displaying
        puts "----------------"
    end

end