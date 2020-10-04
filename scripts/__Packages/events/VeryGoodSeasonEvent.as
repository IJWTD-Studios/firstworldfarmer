class events.VeryGoodSeasonEvent extends events.Event
{
   function VeryGoodSeasonEvent()
   {
      super();
      this.image = "verygoodseasonpic";
      this.title = _root.veryGoodSeasonEventTitle;
      this.description = _root.veryGoodSeasonEvDe;
      this.secDescription = _root.veryGoodSeasonEvDe2nd;
      trace(_root.veryGoodSeasonEvDe);
      mvcFarm.FarmModel.getModel().handle_event("veryGood");
   }
}
