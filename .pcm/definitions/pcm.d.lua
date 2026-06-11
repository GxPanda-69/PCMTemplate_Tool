---@meta

-- ==========================================
-- BASIC EVENT TYPES
-- ==========================================

---@class RBXScriptConnection
---@field Connected boolean Whether the connection is still active.
RBXScriptConnection = {}

---Disconnects the listener from the event.
function RBXScriptConnection:Disconnect() end

---@class RBXScriptSignal
RBXScriptSignal = {}

---Connects a function to the event.
---@param callback function The function to call when the event fires.
---@return RBXScriptConnection
function RBXScriptSignal:Connect(callback) end

---Yields the current thread until the event fires, then returns the arguments.
---@return ... any
function RBXScriptSignal:Wait() end

-- ==========================================
-- BASE INSTANCE (The parent of all Roblox objects)
-- ==========================================

---@class Instance
---@field Name string The name of the instance.
---@field Parent Instance|nil The parent instance of this object.
---@field ClassName string The specific class type of the object.
---@field Changed RBXScriptSignal Fires when a property of the instance changes.
Instance = {}

---Returns the first ancestor of the instance that matches the given name.
---@param name string
---@return Instance|nil
function Instance:FindFirstAncestor(name) end

---Returns the first child of the instance that matches the given name.
---@param name string
---@param recursive? boolean Whether to search descendants as well.
---@return Instance|nil
function Instance:FindFirstChild(name, recursive) end

---Returns an array of all the instance's children.
---@return Instance[]
function Instance:GetChildren() end

---Returns an array of all the instance's descendants.
---@return Instance[]
function Instance:GetDescendants() end

---Destroys the instance and all its descendants.
function Instance:Destroy() end

-- ==========================================
-- DATA TYPES
-- ==========================================

---@class Vector3
---@field X number
---@field Y number
---@field Z number
Vector3 = {}
---@return Vector3
---@param x number
---@param y number
---@param z number
function Vector3.new(x, y, z) end

---@class CFrame
---@field Position Vector3
---@field Rotation Vector3
CFrame = {}
---@return CFrame
---@param pos Vector3
---@param rot Vector3
function CFrame.new(pos, rot) end

---@class Color3
---@field R number
---@field G number
---@field B number
Color3 = {}
---@return Color3
---@param r number
---@param g number
---@param b number
function Color3.new(r, g, b) end

-- ==========================================
-- ROBLOX CLASSES
-- ==========================================

---@class PVInstance : Instance
---@field CFrame CFrame The primary structural coordinate frame.
PVInstance = {}


---@class BasePart : PVInstance
---@field Size Vector3 The physical dimensions of the part.
---@field Position Vector3 The center point of the part in the world.
---@field CFrame CFrame The CFrame of the part.
---@field Color3 Color3 The color scheme of the part.
---@field Anchored boolean Whether the part is unaffected by physics.
---@field CanCollide boolean Whether the part collides with other parts.
---@field Touched RBXScriptSignal Fires when another part touches this part.
BasePart = {}


---@class Part : BasePart
---@field Shape string The geometric shape of the part (Block, Ball, Cylinder, etc).
Part = {}


---@class MeshPart : BasePart
---@field MeshId string The asset URI for the mesh data.
---@field TextureID string The asset URI for the texture applied to the mesh.
MeshPart = {}


---@class Model : PVInstance
---@field PrimaryPart BasePart|nil The central part used as a physical reference.
Model = {}

---@param cframe CFrame
function Model:PivotTo(cframe) end

---@return CFrame cframe, Vector3 size
function Model:GetBoundingBox() end

---@class Player : Instance
---@field UserId integer The unique identification number for the player's account.
---@field DisplayName string The player's visible display name.
---@field Character Model|nil The 3D avatar model of the player in the workspace.
---@field CharacterAdded RBXScriptSignal Fires when a player's character spawns or respawns.
---@field EquipsItem RBXScriptSignal Fires when a player starts holding an item.
Player = {}

---@class Tool : Instance
---@field CanBeDropped boolean If the tool can be dropped.
---@field Grip CFrame The grip if the tool (I recommend to use a Tool Grip Editor Roblox Studio plugin).
---@field RequiresHandle boolean Wether the tool can be activated without a handle.
---@field Activated RBXScriptSignal Fires when the player presses left-click while holding the tool.
---@field Deactivated RBXScriptSignal Fires when the player releases left-click while holding the tool.
---@field Equipped RBXScriptSignal Fires when the tool is equipped.
---@field Unequipped RBXScriptSignal Fires when the tool is unequipped.
Tool = {}

-- ==========================================
-- PCM CLASSES
-- ==========================================

---@class Item : Instance
---@field Holder Player|nil The player that is holding the item (nil if not held).
---@field MeshID string The ID of the mesh of the item, formatted like "rbxassetid://...".
---@field TextureID string The ID of the texture of the mesh, formatted like "rbxassetid://...".
---@field Cooldown number The amount of time in seconds between every activation.
---@field Tool Tool The tool Instance for the item (advanced)
---@field Used RBXScriptSignal Fires when the player clicks while holding the item.
---@field Equipped RBXScriptSignal Fires when the player starts holding the item.
---@field Unequipped RBXScriptSignal Fires when the item is unequipped.
Item = {}
