var LEADERBOARD_ID = "1003";
function OBS_getBestScores()
{
   var res = new XML();
   res.onLoad = function(success)
   {
      if(success)
      {
         trace("Succesfully loaded scores");
         var _loc4_ = _root.attachMovie("highScoreList","hUnique",_root.getNextHighestDepth());
         _loc4_._x = Stage.width / 2 - _loc4_._width / 2;
         _loc4_._y = Stage.height / 2 - _loc4_._height / 2;
         var _loc3_ = 0;
         while(_loc3_ < 10)
         {
            _loc4_["n" + (_loc3_ + 1)].text = res.childNodes[1].childNodes[_loc3_ * 2 + 1].attributes.username;
            _loc4_["s" + (_loc3_ + 1)].text = res.childNodes[1].childNodes[_loc3_ * 2 + 1].childNodes[1].attributes.score;
            _loc3_ = _loc3_ + 1;
         }
         _loc4_.okayButton.onRelease = function()
         {
            this._parent.removeMovieClip();
         };
      }
      else
      {
         trace("Failed to load scores.");
      }
   };
   var _loc5_ = new LoadVars();
   _loc5_.api_key = API_KEY;
   _loc5_.game_id = GAME_ID;
   _loc5_.response = "XML";
   _loc5_.limit = "10";
   _loc5_.order_by = "score";
   _loc5_.sendAndLoad("https://api.scoreoid.com/v1/getBestScores",res,"POST");
}
function OBS_showNamePrompt(scoreVal)
{
   var _loc4_ = _root.attachMovie("namePrompt","namePromptUnique",_root.getNextHighestDepth());
   _loc4_._x = Stage.width / 2 - _loc4_._width / 2;
   _loc4_._y = Stage.height / 2 - _loc4_._height / 2;
   _loc4_.okayButton.onRelease = function()
   {
      var _loc3_ = new LoadVars();
      _loc3_.onLoad = function(success)
      {
         if(success)
         {
            trace("Score sent successfully!");
            getBestScores();
         }
         else
         {
            trace("Error connecting to server.");
         }
      };
      var _loc2_ = new LoadVars();
      _loc2_.api_key = API_KEY;
      _loc2_.game_id = GAME_ID;
      _loc2_.response = "XML";
      _loc2_.username = this._parent.nameLabel.text;
      _loc2_.score = scoreVal;
      _loc2_.sendAndLoad("https://api.scoreoid.com/v1/createScore",_loc3_,"POST");
      this._parent.removeMovieClip();
   };
}
function getBestScores()
{
   var _loc5_ = _root.attachMovie("highscoreList","hUnique",_root.getNextHighestDepth());
   hUnique._x = (Stage.width - hUnique._width) / 2;
   hUnique._y = (Stage.height - hUnique._height) / 2;
   var res = new XML();
   res.ignoreWhite = true;
   res.onLoad = function(success)
   {
      if(success)
      {
         trace("Succesfully loaded scores");
         var _loc3_ = 0;
         while(_loc3_ < 10)
         {
            hUnique["n" + (_loc3_ + 1)].text = res.firstChild.childNodes[_loc3_].childNodes[0].childNodes[0];
            hUnique["s" + (_loc3_ + 1)].text = res.firstChild.childNodes[_loc3_].childNodes[1].childNodes[0];
            if(hUnique["n" + (_loc3_ + 1)].text == "undefined")
            {
               hUnique["n" + (_loc3_ + 1)].text = "-";
            }
            if(hUnique["s" + (_loc3_ + 1)].text == "undefined")
            {
               hUnique["s" + (_loc3_ + 1)].text = "-";
            }
            _loc3_ = _loc3_ + 1;
         }
         hUnique.okayButton.onRelease = function()
         {
            this._parent.removeMovieClip();
            _root.play();
         };
      }
      else
      {
         trace("Failed to load scores.");
      }
   };
   var _loc4_ = new LoadVars();
   _loc4_.leaderboard_id = LEADERBOARD_ID;
   _loc4_.functionToCall = "getScores";
   _loc4_.response = "XML";
   _loc4_.sendAndLoad("http://creativesparkstudios.com/api/scores.php",res,"POST");
}
function showNamePrompt(scoreVal)
{
   var _loc3_ = _root.attachMovie("namePrompt","namePromptUnique",_root.getNextHighestDepth());
   _loc3_._x = Stage.width / 2 - _loc3_._width / 2;
   _loc3_._y = Stage.height / 2 - _loc3_._height / 2;
   _loc3_.nameLabel.onSetFocus = function()
   {
      this.text = "";
   };
   _loc3_.okayButton.onRelease = function()
   {
      if(this._parent.nameLabel.text.length > 0)
      {
         result_lv = new XML();
         result_lv.ignoreWhite = true;
         result_lv.onLoad = function(success)
         {
            if(success)
            {
               trace("Score sent successfully!");
               getBestScores();
            }
            else
            {
               trace("Error connecting to server.");
            }
         };
         sender = new LoadVars();
         sender.leaderboard_id = LEADERBOARD_ID;
         sender.functionToCall = "submitScore";
         sender.response = "XML";
         sender.playerName = this._parent.nameLabel.text;
         sender.score = scoreVal;
         sender.sendAndLoad("http://creativesparkstudios.com/api/scores.php",result_lv,"POST");
         this._parent.removeMovieClip();
      }
   };
}
if(_root.reasonForGameEnd == "everyoneDied")
{
   roundsOutput = gameOverReason1;
}
else if(_root.reasonForGameEnd == "noadultsleft")
{
   roundsOutput = gameOverReason2;
}
else if(_root.reasonForGameEnd == "win")
{
   roundsOutput = gameOverReason3;
}
roundsOutput = roundsOutput + ("\n" + roundsOutput1 + turnCount + roundsOutput2);
_root.ScoreVal = turnCount;
_root.ScoreVal = 0;
ScoreVal = ScoreVal + turnCount * 10;
scoreBreakdown.reasons.text = _root.sbTurns + turnCount + " (x 10)\n";
scoreBreakdown.results.text = "= " + turnCount * 10 + "\n";
if(_root.totalSchoolCount > 0)
{
   trace("school years:" + totalSchoolCount);
   ScoreVal = ScoreVal + _root.totalSchoolCount * 100;
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbYearsInSchool + "" + _root.totalSchoolCount + " (x 10)\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + ("= " + _root.totalSchoolCount * 10 + "\n");
}
if(_root.totalBabyCount > 0)
{
   trace("babies:" + totalBabyCount);
   ScoreVal = ScoreVal + _root.totalBabyCount * 25;
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbBabiesBorn + _root.totalBabyCount + "(x 25)\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + ("= " + _root.totalBabyCount * 25 + "\n");
}
if(_root.totalMarriageCount > 0)
{
   trace("marriages:" + totalMarriageCount);
   ScoreVal = ScoreVal + _root.totalMarriageCount * 25;
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbMarriages + _root.totalMarriageCount + " (x 25)\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + ("= " + _root.totalMarriageCount * 25 + "\n");
}
var projectCount = 0;
if(communicationsBuilt)
{
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbComBuilt + "\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + "= 50\n";
   ScoreVal = ScoreVal + 50;
   projectCount++;
}
if(infrastructureBuilt)
{
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbInfBuilt + "\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + "= 50\n";
   ScoreVal = ScoreVal + 50;
   projectCount++;
}
if(schoolBuilt)
{
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbSchBuilt + "\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + "= 50\n";
   ScoreVal = ScoreVal + 50;
   projectCount++;
}
if(clinicBuilt)
{
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbCliBuilt + "\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + "= 50\n";
   ScoreVal = ScoreVal + 50;
   projectCount++;
}
if(representativeBuilt)
{
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbRepBuilt + "\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + "= 50\n";
   ScoreVal = ScoreVal + 50;
   projectCount++;
}
if(insuranceBuilt)
{
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbInsBuilt + "\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + "= 50\n";
   ScoreVal = ScoreVal + 50;
   projectCount++;
}
if(projectCount == 6)
{
   scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + (_root.sbBonus + "\n");
   scoreBreakdown.results.text = scoreBreakdown.results.text + "= 500\n";
   ScoreVal = ScoreVal + 500;
}
scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + "-------------------------------\n";
scoreBreakdown.results.text = scoreBreakdown.results.text + "--------\n";
scoreBreakdown.reasons.text = scoreBreakdown.reasons.text + "TOTAL";
scoreBreakdown.results.text = scoreBreakdown.results.text + ("= " + ScoreVal);
_root.creditsText = _root.creditsTextLang;
trace("scoreVal:" + ScoreVal);
playAgainButton.onPress = function()
{
   play();
};
linkButton.onPress = function()
{
   linkButton.getURL("http://www.3rdworldfarmer.com/links.html","_blank");
};
fbButton.onRelease = function()
{
   getUrl("http://www.facebook.com/pages/3rd-World-Farmer/371492668017", "_blank");
};
var result_lv;
var sender;
submitScoreButton1.onPress = function()
{
   showNamePrompt(_root.ScoreVal);
   _root.submitScoreButton1._visible = false;
};
