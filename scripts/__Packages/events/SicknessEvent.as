class events.SicknessEvent extends events.Event
{
   function SicknessEvent()
   {
      super();
      this.image = "sickpersoninbedpic";
      this.title = _root.sicknessEventTitle;
      this.description = _root.sicknessEvDe;
      this.secDescription = _root.sicknessEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("sickness");
   }
}
