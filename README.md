This is my first iOS application. It is a simple application that contains three different View Controllers. The first View Controller is the
Welcome Screen of the application and contains only a UIButton that navigates the user to the next View Controller, called
NFTScreenViewController. This View Controller contains a UITableView which is populated with data parsed from a JSON file, called nfts1.json.
The table view contains two different cell types, that display different data from the JSON file. The third View Controller is called
NFTDetailsViewController and we navigate to it, through the push of the CustomTableViewCell. Inside this View Controller we display, for 
each of the distinct nft objects parsed from the JSON file, some of the object's attributes and the object's image.
UPDATE: I have also added the JSON file to my project, to parse the JSON data to my application through a local file. The JSON file is called MyJSON.json. This change has been made in order to get in touch with more technologies, using Swift.
