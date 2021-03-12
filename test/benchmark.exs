Benchee.run(%{
  parallel: fn -> HoursReport.build(["gen_report"]) end,
  single: fn -> HoursReport.build_from_many(["report_1", "report_2", "report_3"]) end
})
