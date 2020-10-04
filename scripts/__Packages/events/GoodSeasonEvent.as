class events.GoodSeasonEvent extends events.Event
{
   function GoodSeasonEvent()
   {
      super();
      this.image = "goodseasonpic";
      this.title = _root.goodSeasonEventTitle;
      this.description = _root.goodSeasonEvDe;
      this.secDescription = _root.goodSeasonEvDe2nd;
      trace(_root.goodSeasonEvDe);
      mvcFarm.FarmModel.getModel().handle_event("Good");
   }
}
