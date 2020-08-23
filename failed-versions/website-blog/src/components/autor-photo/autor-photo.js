import React from "react"
import { useStaticQuery, graphql } from "gatsby"

import * as S from "./style"

const AutorPhoto = () => {
  const data = useStaticQuery(graphql`
    query {
      placeholderImage: file(relativePath: { eq: "laks-icon.jpg" }) {
        childImageSharp {
          fluid(maxWidth: 85) {
            ...GatsbyImageSharpFluid_tracedSVG
          }
        }
      }
    }
  `)

  return (
    <S.ImagemWrapper>
      <S.Imagem fluid={data.placeholderImage.childImageSharp.fluid} />
    </S.ImagemWrapper>
  )
}

export default AutorPhoto
