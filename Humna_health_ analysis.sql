select * from patient
select * from outcomes
select * from diagnoses
select * from Labs;

-- Retrive data from the lab history 
select p.patientID, p.Name , d.DiagnosisName, 
o.OutcomeName,l.TestName, l.result,l.Normalrange
from patient p 
join diagnoses d on p.DiagnosisID = d.DiagnosesId
join outcomes o on p.OutcomeID = o.OutcomeID
join Labs l on p.PatientID = l.PatientID
order by p.PatientID, l.TestName;

--Average Lab results by Diagnosis
select d.DiagnosisName ,l.TestName,avg(l.result)as AvgResult
from patient p
join diagnoses d on p.DiagnosisID = d.DiagnosesId
join Labs l on p.PatientID = l.PatientID
group by d.diagnosisname,l.testname;

-- Abnormal Lab results 
select p.patientid, p.name,count(*) as Abnormalcount
from patient p
join Labs l on p.PatientID = l.PatientID
where (l.TestName = 'Blood sugar'and l.Result >120 )OR
 (l.TestName = 'Cholestrol'and l.Result >200 )OR
  (l.TestName = 'Hemoglobin'and l.Result >13 )
group by p.PatientID ,p.Name
order by Abnormalcount desc;

--Dignosis with higest treatment costs
select d.diagnosisname ,sum(p.treatmentcost) as TOtalcost 
from patient p 
join diagnoses d on p.DiagnosisID = d.DiagnosesId
group by d.DiagnosisName
order by TOtalcost desc;

-- patient at risk by there age 
select p.PatientID, p.name, p.age,d.DiagnosisName,o.outcomename
from patient p
join diagnoses d on p.DiagnosisID = d .DiagnosesId
join outcomes o on P.OutcomeID = o.OutcomeID
where p.age > 65 and  o.OutcomeName != 'Recovered';

-- Lab trends over tiem foe a spesific patient 
select l.Testname,l.result, p.admissiondate
from Labs l
join patient p on l.PatientID = p.PatientID
where p.PatientID in (2,3,4,5,6)
order by p.AdmissionDate;

--Distubution of outcome by diagnosis
select d.diagnosisname , o.outcomename, count(*) as Outcomecount
from patient p
join diagnoses d on d.DiagnosesId = p.DiagnosisID
join outcomes o on o.OutcomeID = p.OutcomeID
group by d.DiagnosisName,o.OutcomeName
order by d.DiagnosisName,o.OutcomeName desc;