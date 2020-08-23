import React from "react"

import AutorPhoto from "../autor-photo/autor-photo"

import { useStaticQuery, graphql } from "gatsby"

import * as S from "./style"

const Profile = () => {
    const { site: { siteMetadata} } = useStaticQuery(
      graphql`
        query {
          site {
            siteMetadata {
              title
              description
              ocupacao
            }
          }
        }
      `
    )
    
    return(
        <S.ProfileWrapper>
            <S.ProfileMain to="/about">
              <AutorPhoto />
              <S.ProfileText>
                <S.ProfileTitle>{siteMetadata.title}</S.ProfileTitle>
                <S.ProfileOcupacao>{siteMetadata.ocupacao}</S.ProfileOcupacao>
              </S.ProfileText>
            </S.ProfileMain>
            <S.ProfileDescription>{siteMetadata.description}</S.ProfileDescription>
        </S.ProfileWrapper>
    )
}

export default Profile