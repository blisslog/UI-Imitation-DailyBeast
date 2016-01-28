//
//  DataManager.swift
//  NEWS
//
//  Created by TS0442 on 2016. 1. 21..
//  Copyright © 2016년 TS. All rights reserved.
//

import UIKit

class DataManager {
    var items = [Article]()
    
    class var sharedInstance: DataManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: DataManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = DataManager()
        }
        return Static.instance!
    }
    
    private init() {
        print("DataManager init");
        
        var titles = [String]()
        var descs = [String]()
        var contents = [String]()
        
        titles = ["Marco Rubio's 'Illegal'\nBromance"
            , "The Secret Gay World of ISIS"
            , "CIA Eyes Russian Hackers in\nGrid Attack"
            , "Photo of the Day"
            , "Marco Rubio's 'Illegal'\nBromance"
            , "The Secret Gay World of ISIS"
            , "CIA Eyes Russian Hackers in\nGrid Attack"
            , "Photo of the Day"
            , "Marco Rubio's 'Illegal'\nBromance"
            , "The Secret Gay World of ISIS"
            , "CIA Eyes Russian Hackers in\nGrid Attack"
            , "Photo of the Day"
            , "Marco Rubio's 'Illegal'\nBromance"
            , "The Secret Gay World of ISIS"
            , "CIA Eyes Russian Hackers in\nGrid Attack"
            , "Photo of the Day"]
        
        descs = ["What do you get when you combine Rubio's slimy friend and their joint push to help undocumented immigrants get in-stataaaaaaaaaaaaaaaaa"
            , "ISIS Murdered a 15-year-old accused of being gay but spared the life of his 'rapist,' a senior jihadi commander. What lies behindaaaaaaaaaaaaaaaaa"
            , "Somebody hacked the Ukrainian power grid just before Christmas-and U.S. intel analysts are looking toward Moscoaaaaaaaaaaaaaaaaa"
            , "The best images from around the world"
            , "What do you get when you combine Rubio's slimy friend and their joint push to help undocumented immigrants get in-stataaaaaaaaaaaaaaaaa"
            , "ISIS Murdered a 15-year-old accused of being gay but spared the life of his 'rapist,' a senior jihadi commander. What lies behindaaaaaaaaaaaaaaaaa"
            , "Somebody hacked the Ukrainian power grid just before Christmas-and U.S. intel analysts are looking toward Moscoaaaaaaaaaaaaaaaaa"
            , "The best images from around the world"
            , "What do you get when you combine Rubio's slimy friend and their joint push to help undocumented immigrants get in-stataaaaaaaaaaaaaaaaa"
            , "ISIS Murdered a 15-year-old accused of being gay but spared the life of his 'rapist,' a senior jihadi commander. What lies behindaaaaaaaaaaaaaaaaa"
            , "Somebody hacked the Ukrainian power grid just before Christmas-and U.S. intel analysts are looking toward Moscoaaaaaaaaaaaaaaaaa"
            , "The best images from around the world"
            , "What do you get when you combine Rubio's slimy friend and their joint push to help undocumented immigrants get in-stataaaaaaaaaaaaaaaaa"
            , "ISIS Murdered a 15-year-old accused of being gay but spared the life of his 'rapist,' a senior jihadi commander. What lies behindaaaaaaaaaaaaaaaaa"
            , "Somebody hacked the Ukrainian power grid just before Christmas-and U.S. intel analysts are looking toward Moscoaaaaaaaaaaaaaaaaa"
            , "The best images from around the world"]
        
        contents = [
            "Obama brought the psychological enfranchisement of millions of voters who hadn’t bothered before. After he leaves, will they bother still?\n\nFor the remainder of President Obama’s term in office countless experts will debate his successes and failures and how he ranks in the pantheon of presidents, but arguably his most significant achievement will probably continue to fly under the radar—and may not persist beyond his presidency. Obama’s presidency has psychologically enfranchised large swaths of America’s electorate—reshaping our democracy—who previously opted to stay home and focus on the day-to-day struggles of life instead of showing up to the polls and becoming politically active.\n\nDuring Obama’s presidential campaigns, his get-out-the-vote efforts, specifically targeting African American,s were incredibly successful. He turned a voting base that has historically voted at a lower percentage than white Americans to one that surpassed them. In 1996 only 53 percent of eligible African American voters voted compared to 63 percent for whites. During Obama’s 2008 campaign 65 percent of eligible African American voters voted and 66 percent for whites. In a little over a decade African American representation had increased by 12 percent and in 2012 it increased further to 66 percent, surpassing the percentage of white voters—for the first time in history—by 2 percent.\n\nIn 2008 just over 16 million African Americans voted (PDF), and in 2012 nearly 18 million voted, and in both cases their support for Obama helped swing the election in his favor. In 2000 only 12.9 million (57 percent) African Americans voted, and in 2004 only 14 million (60 percent) voted. Essentially, the difference between 2004 and 2008 was only 2 million votes out of the roughly 130 million votes cast, but in the minds of countless African Americans and other marginalized voters their votes helped decide an election in their favor.\n\nEach and every African American voter who voted for Obama in 2008 felt upon his election that they had assisted in making the previously thought impossible reality of electing a black man to be President of the United States come true. They could feel the power and significance of their vote, and they felt like an enfranchised population that could make an impact on the national scale. This represents a significant change in the mindset of an African American electorate that has historically been more accustomed to an American democracy that has worked to discourage and disenfranchise them.\n\nIn 2012 after the euphoria of Obama’s election had mostly worn off, nearly 2 million more African Americans voted for Obama than in 2008, so the importance of voting was not lost on this electorate during the ensuing four years. And as one minority group revels in the newly found authority of their vote, so too will others. The habit of voting is becoming ingrained throughout marginalized and minority communities, and this represents a significant shift in our electoral process.\n\n2016 is already being described as an election that could be decided by the Latino vote, and Democrats know they need to work hard to keep the African American vote. Two election cycles where African Americans showed up to the polls in large numbers make it more likely that they will do the same thing the third time around, but this psychologically enfranchised electorate now demands more from candidates if they intend to earn their vote.\n\nPrior to Obama’s presidency African Americans could never expect a presidential candidate to fully understand the issues that acutely plague this community. Black voters previously could only hope that a white candidate would decide to listen to their voice, and hopefully enact policies that benefited the community.\n\nHowever, during this election cycle it is obvious that black voters expect the candidates who hope to earn their votes to do more than just listen, and they need to feel that the candidate truly understands the problems that ails their communities. Settling for listening, which used to be the status quo, is no longer acceptable. The rise of the Black Lives Matter movement and the controversies and clashes that BLM has had with presidential candidates shows how the expectations, demands, and civic and political engagement has increased within the African American community since the significance of their votes has become evident.\n\nAdditionally, the Latino community has taken a much larger role in the political process since 2008. Much of their growing significance can be attributed to their steady rise in population, but their population growth coincides with a rise in minority representation and participation in our electoral process.\n\nIn 2000 African Americans were only 10 percent of the electorate, but by 2008 they were 13 percent, and have stayed at this level ever since. Likewise, Latinos were only 7 percent, but have increased their representation by 1 percent in each election cycle. In 2016 Latinos could represent over 11 percent of the electorate, but they still would need to increase their voter participation by a sizable margin. In 2012, a record 11.2 million Latinos voted, but that was only 48 percent of Latino voters, and a decrease from the 49.9 percent from 2012. Essentially, Latino voter participation is increasing, but their voter participation percentage has decreased as their population grows. It will be next to impossible for their percentage of eligible voters who vote to match the mid to high 60s of the white and African American communities, but an increase to over 50 percent could help them decide an election.\n\nAnd while it is difficult to attribute a shifting national perspective to any one person, we cannot ignore the efforts that Obama has taken make people aware, specifically minorities and African Americans, of how important their votes can be. And we also cannot discredit the impact upon Americans of seeing a minority occupy the highest office in the land.\n\nThe convergence of these two realities has given many Americans not just a sense of being connected to and valued within their society, but also an additional incentive to participate in the democratic process. The previously thought impossible became possible with Obama’s election, and then it became more and more routine throughout his presidency. Additionally, the growing influence of African Americans has provided a pathway for other minorities to create their own influential path toward influencing American society.\n\nGet The Daily Beast In Your Inbox\n\nEnter your email address\nSUBSCRIBE\nFollow The Daily Beast\nFollow @thedailybeast\nHowever, the conundrum surrounding this new electoral and enfranchisement map is whether it can be sustained after Obama’s presidency. All three Democrat candidates have struggled to relate to African American and Latino voters, and the GOP has spent more time demonizing these minorities than trying to connect to them. Already black millennials are exhibiting the political angst and indifference that has inclined many members of this generation to abstain from voting and the political process. Additionally, they are confronting the new reality that their next president will not be black, and may be more of a bureaucrat than an inspirational, transcendent figure.\n\nFor America’s new inclusive, diverse, and enfranchised voting body to retain its power for election cycles to come, this new electorate must have a new purpose for making it to the polls, and the institutional support for speaking up to fight the injustices in their communities. Obama proved to be the catalyst for this new era of democratic enfranchisement, but now the responsibility to sustain it must fall on other shoulders. Let’s hope that the commitment to the democratic process, civil engagement, and diversity can be sustained for generations to come.",
            "Fox’s new show Lucifer has conservative Christian groups up in arms, and they may (unwittingly) have a point.\n\nIf you can imagine Satan roaming around the streets of Los Angeles like he’s Justin Bieber, circa 2013—driving a fast car, catching the interested stares from both girls and boys at the bars, and getting into trouble with the law, the ladies, and the Lord all at the same time—you’ll have a pretty good idea of how Fox’s new TV show, Lucifer, begins.\n\nThat’s right, America—Fox is bringing a show about Satan to primetime. Nobody’s shocked, really. This is a network owned by a company that, for years, has enabled the public with nightly doses of Bill O’Reilly. Moreover, some Americans—likely Bill O’Reilly fans—have long decried Fox as one of the Devil’s Networks, suggesting that shows like Family Guy and/or Glee to be the feces of Satan.\n\nOf course, it’s obvious why Fox is taking a chance on Lucifer. Like the network’s semi-hit show Gotham, the lead character is derived from a DC Comics series, a trend that a lot of networks—from Netflix to The CW—are following, banking huge budgets on shows adapted from comic book characters.\n\nFox’s new show Lucifer has conservative Christian groups up in arms, and they may (unwittingly) have a point.\n\nIf you can imagine Satan roaming around the streets of Los Angeles like he’s Justin Bieber, circa 2013—driving a fast car, catching the interested stares from both girls and boys at the bars, and getting into trouble with the law, the ladies, and the Lord all at the same time—you’ll have a pretty good idea of how Fox’s new TV show, Lucifer, begins.\n\nThat’s right, America—Fox is bringing a show about Satan to primetime. Nobody’s shocked, really. This is a network owned by a company that, for years, has enabled the public with nightly doses of Bill O’Reilly. Moreover, some Americans—likely Bill O’Reilly fans—have long decried Fox as one of the Devil’s Networks, suggesting that shows like Family Guy and/or Glee to be the feces of Satan.\n\nOf course, it’s obvious why Fox is taking a chance on Lucifer. Like the network’s semi-hit show Gotham, the lead character is derived from a DC Comics series, a trend that a lot of networks—from Netflix to The CW—are following, banking huge budgets on shows adapted from comic book characters."]
        
        var cnt = 0
        repeat {
            let article:Article = Article()
            article.setArticle(titles[cnt], desc: descs[cnt], content: contents[cnt%2])
            items.append(article)
            cnt++
        } while cnt < titles.count
        

    }
    
}
