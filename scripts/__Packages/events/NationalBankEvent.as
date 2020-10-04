class events.NationalBankEvent extends events.Event
{
   function NationalBankEvent()
   {
      super();
      this;
      this.image = "bankbuildingpic";
      this.title = _root.nationalBankEventTitle;
      this.description = _root.nationalBankEvDe;
      this.secDescription = _root.nationalBankEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("nationalbank");
   }
}
