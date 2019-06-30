import Foundation
import SpriteKit

class Player: SKSpriteNode {
    
    let wingSound = SKAction.playSoundFileNamed("wing", waitForCompletion: false)
    let dieSound = SKAction.playSoundFileNamed("die", waitForCompletion: false)
    
    let animation: SKAction = {
        var textures: [SKTexture] = []
        var action: SKAction
        
        for i in 1...3 {
            textures.append(SKTexture(imageNamed: "yellowbird\(i)"))
        }
        
        textures.append(textures[2])
        textures.append(textures[1])
        action = SKAction.animate(with: textures, timePerFrame: 0.1)
        
        return action
    }()
    
    func spawn(at point: CGPoint) -> Player {
        let player = Player(texture: SKTexture(imageNamed: "yellowbird1" ))
        
        player.setScale(3)
        player.position = point
        
        player.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "yellowbird2"), size: player.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.isDynamic = true
        player.physicsBody?.categoryBitMask = BitMaskCategory.player
        player.physicsBody?.collisionBitMask = BitMaskCategory.base // | BitMaskCategory.трубы
        player.physicsBody?.contactTestBitMask = BitMaskCategory.base // | BitMaskCategory.трубы
        
        player.startAnimation()
        player.startMenuAnimation()
        
        return player
    }
    
    func jump() {        
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 120))
        self.run(wingSound)
    }
    
    func gameStarted() {
        self.physicsBody?.affectedByGravity = true
        self.stopMenuAnimation()
        self.jump()
    }
    
    func gameEnded() {
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.stopAnimation()
        self.run(dieSound)
    }
}
