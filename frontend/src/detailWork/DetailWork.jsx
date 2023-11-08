import { useEffect, useState } from "react"
import { useLocation } from "react-router-dom"
import "./detailWork.scss"
import axios from "axios"

const DetailWork = () => {
  const [jobs, setJobs] = useState([])
  const [jobsFit, setJobsFit] = useState([])
  const [user, setUser] = useState({id : 1})
  let location = useLocation()

  useEffect(() => {
    setUser(location.state.user)
  }, [JSON.stringify(location.state.user)])
  
  useEffect(() => {
    let apiGetDataInfo = async () => {
      let data = await axios.get(
        `http://localhost:8080/company/get-info/${location.state.companyID}`
      );
      setJobs(data.data);
    };
    apiGetDataInfo();
  }, []);

  useEffect(() => {
    console.log(jobs.length > 0);
    let apiGetSkillCandidate = async () => {
      let datas = await axios.post(
        `http://localhost:8080/company/get-skill-candidate`,
        {
          candidateID : user.id,
          companyID : location.state.companyID
        }
      );
      setJobsFit(datas.data);
    };
    apiGetSkillCandidate();
  }, []);

  return (
    <div className="container-detail-work">
      <span className="header">{jobs.length > 0 && jobs[0].job.company.name}</span>
      <div className="content-works">
        {jobs.map((data, index) => (
          <div key={index} className="content-work"
          style={{
            backgroundColor : jobsFit.find(j => j.job.id === data.job.id && j.skill.id === data.skill.id && j.job.level === data.job.level) !== undefined && "yellow"
          }}
          >
            <span className="description-job">{data.job.description}</span>
            <div className="content-company">
              <span>Skill_Name : {data.skill.skillName}</span>
              <span>Skill_Type : {data.skill.skillType}</span>
              <span>Skill_Description : {data.skill.skillDescription}</span>
              <span>Level : {data.level}</span>
              <span>More_Information : {data.moreInfo}</span>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

export default DetailWork