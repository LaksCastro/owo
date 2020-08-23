const path = require("path")
const { createFilePath } = require("gatsby-source-filesystem")

exports.onCreateNode = ( { node, getNode, actions } ) => {
    const { createNodeField } = actions

    if(node.internal.type === "MarkdownRemark"){
        const slug = createFilePath({
            node,
            getNode, 
            basePath: "pages",
        })
        createNodeField({
            node,
            name: "slug",
            value: `${slug}`
        })
    }
}

exports.createPages = ( { graphql, actions } ) => {
    const { createPage } = actions
    return graphql(`
      {
        allMarkdownRemark(sort: {fields: frontmatter___date, order: DESC}) {
          edges {
            node {
              frontmatter {
                background
                date(locale: "pt-br", difference: "", formatString: "DD [de] MMMM [de] YYYY")
                description
                category
                title
                image
              }
              fields {
                slug
              }
              timeToRead
            }
            next {
              frontmatter {
                title
              }
              fields {
                slug
              }
              timeToRead
            }
            previous {
              fields {
                slug
              }
              frontmatter {
                title
              }
              timeToRead
            }
          }
        }
      }      
    `).then( result => {
        const posts = result.data.allMarkdownRemark.edges
        
        posts.forEach(({ node, next, previous }) => {
            createPage({
                path: node.fields.slug,
                component: path.resolve("./src/templates/blog-post.js"),
                context: {
                    slug: node.fields.slug,
                    prevPost: next,
                    nextPost: previous
                }
            })
        })
        const postsPerPage = 10
        const numPages = Math.ceil(posts.length / postsPerPage)

        Array.from({ length: numPages }).forEach((_, index) => {
            createPage({
                path: index === 0 ? `/` : `/page/${index + 1}`,
                component: path.resolve(`./src/templates/blog-list.js`),
                context: {
                    limit: postsPerPage,
                    skip: index * postsPerPage,
                    numPages,
                    currentPage: index + 1,
                },
            })
        })

    })
}
